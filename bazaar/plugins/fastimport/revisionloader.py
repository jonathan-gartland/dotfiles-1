# Copyright (C) 2008 Canonical Ltd
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

"""Parameterised loading of revisions into a repository."""


from bzrlib import errors, knit, lru_cache, osutils
from bzrlib import revision as _mod_revision


class AbstractRevisionLoader(object):
    # NOTE: This is effectively bzrlib.repository._install_revision
    # refactored to be a class. When importing, we want more flexibility
    # in how previous revisions are cached, data is feed in, etc.

    def __init__(self, repo):
        """An object responsible for loading revisions into a repository.

        NOTE: Repository locking is not managed by this class. Clients
        should take a write lock, call load() multiple times, then release
        the lock.

        :param repository: the target repository
        """
        self.repo = repo

    def load(self, rev, inv, signature, text_provider,
        inventories_provider=None):
        """Load a revision into a repository.

        :param rev: the Revision
        :param inv: the inventory
        :param signature: signing information
        :param text_provider: a callable expecting a file_id parameter
            that returns the text for that file-id
        :param inventories_provider: a callable expecting a repository and
            a list of revision-ids, that returns:
              * the list of revision-ids present in the repository
              * the list of inventories for the revision-id's,
                including an empty inventory for the missing revisions
            If None, a default implementation is provided.
        """
        if inventories_provider is None:
            inventories_provider = self._default_inventories_provider
        present_parents, parent_invs = inventories_provider(rev.parent_ids)
        self._load_texts(rev.revision_id, inv.iter_entries(), parent_invs,
            text_provider)
        try:
            rev.inventory_sha1 = self._add_inventory(rev.revision_id,
                inv, present_parents)
        except errors.RevisionAlreadyPresent:
            pass
        if signature is not None:
            self.repo.add_signature_text(rev.revision_id, signature)
        self._add_revision(rev, inv)

    def _load_texts(self, revision_id, entries, parent_invs, text_provider):
        """Load texts to a repository for inventory entries.
        
        This method is provided for subclasses to use or override.

        :param revision_id: the revision identifier
        :param entries: iterator over the inventory entries
        :param parent_inv: the parent inventories
        :param text_provider: a callable expecting a file_id parameter
            that returns the text for that file-id
        """
        raise NotImplementedError(self._load_texts)

    def _add_inventory(self, revision_id, inv, parents):
        """Add the inventory inv to the repository as revision_id.
        
        :param parents: The revision ids of the parents that revision_id
                        is known to have and are in the repository already.

        :returns: The validator(which is a sha1 digest, though what is sha'd is
            repository format specific) of the serialized inventory.
        """
        return self.repo.add_inventory(revision_id, inv, parents)

    def _add_revision(self, rev, inv):
        """Add a revision and its inventory to a repository.

        :param rev: the Revision
        :param inv: the inventory
        """
        repo.add_revision(rev.revision_id, rev, inv)

    def _default_inventories_provider(self, revision_ids):
        """An inventories provider that queries the repository."""
        present = []
        inventories = []
        for revision_id in revision_ids:
            if self.repo.has_revision(revision_id):
                present.append(revision_id)
                rev_tree = self.repo.revision_tree(revision_id)
            else:
                rev_tree = self.repo.revision_tree(None)
            inventories.append(rev_tree.inventory)
        return present, inventories


class RevisionLoader1(AbstractRevisionLoader):
    """A RevisionLoader that uses the old bzrlib Repository API.
    
    The old API was present until bzr.dev rev 3510.
    """

    def _load_texts(self, revision_id, entries, parent_invs, text_provider):
        """See RevisionLoader._load_texts()."""
        # Backwards compatibility hack: skip the root id.
        if not self.repo.supports_rich_root():
            path, root = entries.next()
            if root.revision != revision_id:
                raise errors.IncompatibleRevision(repr(self.repo))
        # Add the texts that are not already present
        tx = self.repo.get_transaction()
        for path, ie in entries:
            # This test is *really* slow: over 50% of import time
            #w = self.repo.weave_store.get_weave_or_empty(ie.file_id, tx)
            #if ie.revision in w:
            #    continue
            # Try another way, realising that this assumes that the
            # version is not already there. In the general case,
            # a shared repository might already have the revision but
            # we arguably don't need that check when importing from
            # a foreign system.
            if ie.revision != revision_id:
                continue
            text_parents = []
            for parent_inv in parent_invs:
                if ie.file_id not in parent_inv:
                    continue
                parent_id = parent_inv[ie.file_id].revision
                if parent_id in text_parents:
                    continue
                text_parents.append(parent_id)
            lines = text_provider(ie.file_id)
            vfile = self.repo.weave_store.get_weave_or_empty(ie.file_id,  tx)
            vfile.add_lines(revision_id, text_parents, lines)

    def _add_revision(self, rev, inv):
        # There's no need to do everything repo.add_revision does and
        # doing so (since bzr.dev 3392) can be pretty slow for long
        # delta chains on inventories. Just do the essentials here ...
        _mod_revision.check_not_reserved_id(rev.revision_id)
        self.repo._revision_store.add_revision(rev, self.repo.get_transaction())


class RevisionLoader2(AbstractRevisionLoader):
    """A RevisionLoader that uses the new bzrlib Repository API."""

    def _load_texts(self, revision_id, entries, parent_invs, text_provider):
        """See RevisionLoader._load_texts()."""
        # Backwards compatibility hack: skip the root id.
        if not self.repo.supports_rich_root():
            path, root = entries.next()
            if root.revision != revision_id:
                raise errors.IncompatibleRevision(repr(self.repo))
        text_keys = {}
        for path, ie in entries:
            text_keys[(ie.file_id, ie.revision)] = ie
        text_parent_map = self.repo.texts.get_parent_map(text_keys)
        missing_texts = set(text_keys) - set(text_parent_map)
        # Add the texts that are not already present
        for text_key in missing_texts:
            ie = text_keys[text_key]
            text_parents = []
            for parent_inv in parent_invs:
                if ie.file_id not in parent_inv:
                    continue
                parent_id = parent_inv[ie.file_id].revision
                if parent_id in text_parents:
                    continue
                text_parents.append((ie.file_id, parent_id))
            lines = text_provider(ie.file_id)
            self.repo.texts.add_lines(text_key, text_parents, lines)

    def _add_revision(self, rev, inv):
        # There's no need to do everything repo.add_revision does and
        # doing so (since bzr.dev 3392) can be pretty slow for long
        # delta chains on inventories. Just do the essentials here ...
        _mod_revision.check_not_reserved_id(rev.revision_id)
        self.repo._add_revision(rev)
 

class ImportRevisionLoader1(RevisionLoader1):
    """A RevisionLoader (old Repository API) optimised for importing.

    This implementation caches serialised inventory texts and provides
    fine-grained control over when inventories are stored as fulltexts.
    """

    def __init__(self, repo, parent_texts_to_cache=1, fulltext_when=None,
        random_ids=True):
        """See AbstractRevisionLoader.__init__.

        :param repository: the target repository
        :param parent_text_to_cache: the number of parent texts to cache
        :para fulltext_when: if non None, a function to call to decide
          whether to fulltext the inventory or not. The revision count
          is passed as a parameter and the result is treated as a boolean.
        """
        RevisionLoader1.__init__(self, repo)
        self.inv_parent_texts = lru_cache.LRUCache(parent_texts_to_cache)
        self.fulltext_when = fulltext_when
        self.random_ids = random_ids
        self.revision_count = 0

    def _add_inventory(self, revision_id, inv, parents):
        """See RevisionLoader._add_inventory."""
        # Code taken from bzrlib.repository.add_inventory
        assert self.repo.is_in_write_group()
        _mod_revision.check_not_reserved_id(revision_id)
        assert inv.revision_id is None or inv.revision_id == revision_id, \
            "Mismatch between inventory revision" \
            " id and insertion revid (%r, %r)" % (inv.revision_id, revision_id)
        assert inv.root is not None
        inv_lines = self.repo._serialise_inventory_to_lines(inv)
        inv_vf = self.repo.get_inventory_weave()
        sha1, num_bytes, parent_text = self._inventory_add_lines(inv_vf,
            revision_id, parents, inv_lines, self.inv_parent_texts)
        self.inv_parent_texts[revision_id] = parent_text
        return sha1

    def _inventory_add_lines(self, inv_vf, version_id, parents, lines,
            parent_texts):
        """See Repository._inventory_add_lines()."""
        # setup parameters used in original code but not this API
        self.revision_count += 1
        if self.fulltext_when is not None:
            delta = not self.fulltext_when(self.revision_count)
        else:
            delta = inv_vf.delta
        left_matching_blocks = None
        random_id = self.random_ids
        check_content = False

        # bzrlib.knit.add_lines() but error checking optimised
        inv_vf._check_add(version_id, lines, random_id, check_content)

        ####################################################################
        # bzrlib.knit._add() but skip checking if fulltext better than delta
        ####################################################################

        line_bytes = ''.join(lines)
        digest = osutils.sha_string(line_bytes)
        present_parents = []
        for parent in parents:
            if inv_vf.has_version(parent):
                present_parents.append(parent)
        if parent_texts is None:
            parent_texts = {}

        # can only compress against the left most present parent.
        if (delta and
            (len(present_parents) == 0 or
             present_parents[0] != parents[0])):
            delta = False

        text_length = len(line_bytes)
        options = []
        if lines:
            if lines[-1][-1] != '\n':
                # copy the contents of lines.
                lines = lines[:]
                options.append('no-eol')
                lines[-1] = lines[-1] + '\n'
                line_bytes += '\n'

        #if delta:
        #    # To speed the extract of texts the delta chain is limited
        #    # to a fixed number of deltas.  This should minimize both
        #    # I/O and the time spend applying deltas.
        #    delta = inv_vf._check_should_delta(present_parents)

        assert isinstance(version_id, str)
        content = inv_vf.factory.make(lines, version_id)
        if delta or (inv_vf.factory.annotated and len(present_parents) > 0):
            # Merge annotations from parent texts if needed.
            delta_hunks = inv_vf._merge_annotations(content, present_parents,
                parent_texts, delta, inv_vf.factory.annotated,
                left_matching_blocks)

        if delta:
            options.append('line-delta')
            store_lines = inv_vf.factory.lower_line_delta(delta_hunks)
            size, bytes = inv_vf._data._record_to_data(version_id, digest,
                store_lines)
        else:
            options.append('fulltext')
            # isinstance is slower and we have no hierarchy.
            if inv_vf.factory.__class__ == knit.KnitPlainFactory:
                # Use the already joined bytes saving iteration time in
                # _record_to_data.
                size, bytes = inv_vf._data._record_to_data(version_id, digest,
                    lines, [line_bytes])
            else:
                # get mixed annotation + content and feed it into the
                # serialiser.
                store_lines = inv_vf.factory.lower_fulltext(content)
                size, bytes = inv_vf._data._record_to_data(version_id, digest,
                    store_lines)

        access_memo = inv_vf._data.add_raw_records([size], bytes)[0]
        inv_vf._index.add_versions(
            ((version_id, options, access_memo, parents),),
            random_id=random_id)
        return digest, text_length, content


class ImportRevisionLoader2(RevisionLoader2):
    """A RevisionLoader (new Repository API) optimised for importing.

    This implementation caches serialised inventory texts.
    Fine-grained control over when inventories are stored as fulltexts
    IS PLANNED LATER.
    """

    def __init__(self, repo, parent_texts_to_cache=1, fulltext_when=None,
        random_ids=True):
        """See AbstractRevisionLoader.__init__.

        :param repository: the target repository
        :param parent_text_to_cache: the number of parent texts to cache
        :para fulltext_when: if non None, a function to call to decide
          whether to fulltext the inventory or not. The revision count
          is passed as a parameter and the result is treated as a boolean.
        """
        RevisionLoader2.__init__(self, repo)
        self.inv_parent_texts = lru_cache.LRUCache(parent_texts_to_cache)
        self.fulltext_when = fulltext_when
        self.random_ids = random_ids
        self.revision_count = 0

    def _add_inventory(self, revision_id, inv, parents):
        """See RevisionLoader._add_inventory."""
        # Code taken from bzrlib.repository.add_inventory
        repo = self.repo
        if not repo.is_in_write_group():
            raise AssertionError("%r not in write group" % (repo,))
        _mod_revision.check_not_reserved_id(revision_id)
        if not (inv.revision_id is None or inv.revision_id == revision_id):
            raise AssertionError(
                "Mismatch between inventory revision"
                " id and insertion revid (%r, %r)"
                % (inv.revision_id, revision_id))
        if inv.root is None:
            raise AssertionError()
        inv_lines = repo._serialise_inventory_to_lines(inv)
        parents = [(parent,) for parent in parents]
        sha1, num_bytes, parent_text = repo.inventories.add_lines(
            (revision_id,), parents, inv_lines, check_content=False)
        self.inv_parent_texts[revision_id] = parent_text
        return sha1
