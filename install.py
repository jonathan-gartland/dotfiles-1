#!/usr/bin/env python2

import sys, os.path, optparse, fileinput
from event import event

def get_parser(arguments):
    usage = "usage: %prog [options] home|work"
    parser = optparse.OptionParser(usage = usage)

    parser.add_option("-v", "--verbose", dest="verbose", default=False,
        help="Print lots of debugging information",
        action="store_true")
    parser.add_option("-n", "--dry-run", dest="dry_run", default=False,
        help="Don't actually run any commands; just print them.",
        action="store_true")
    parser.add_option("-f", "--force", dest="force", default=False,
        help="Ignore existing files/directories.",
        action="store_true")
    parser.add_option("-d", "--dst_dir", dest="dst_dir",
        default=os.environ['HOME'],
        help="LinkSet destination base directory (defaulting to: %s)" %
        os.environ['HOME'], action="store")
    parser.add_option("-s", "--src_dst", dest="src_dir", default=os.getcwd(),
        help="LinkSet source base directory (defaulting to: %s)" % os.getcwd(),
        action="store")

    (options, args) = parser.parse_args(args = arguments)
    return (options, args, parser)

def run(argv):
    (options, args, parser) = get_parser(argv)

    if len(argv) < 2:
        parser.print_help()
        return 1

    if args[1].upper() == "WORK":     install_type = install.WORK
    elif args[1].upper() == "HOME":   install_type = install.HOME
    else:                             install_type = None

    basedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    install(basedir, options, install_type).createLinks()

    return 0

class Link(object):

    def __init__(self, src, dst):
        self.src = src
        self.dst = dst

    def __repr__(self):
        return "class: %s, src: %s, dst: %s\n" % (self.__class__, self.src,
            self.dst)

    @event
    def pre_link_event(self):
        #print self.src, self.dst, 'pre_link_event', "\n"
        None

    @event
    def post_link_event(self):
        #print self.src, self.dst, 'post_link_event', "\n"
        None

class LinkSet(set):

    def __init__(self, *args):
        super(LinkSet, self).__init__(args)

    @event
    def pre_link_event(self):
        #print self.src, self.dst, 'pre_link_event', "\n"
        None

    @event
    def post_link_event(self):
        #print self.src, self.dst, 'post_link_event', "\n"
        None

    def __repr__(self):
        return "class: %s\n" % (self.__class__)

def handler(self):
    print self, "handler \n"

class install(object):

    WORK = 1
    HOME = 2

    def _execute_command(self, command):
        from subprocess import call
        from sys import stderr
        try:
            retcode = call(command, shell=True)
            if retcode < 0:
                print >>stderr, "Child was terminated by signal", -retcode

        except OSError, e:
                print >>stderr, "Execution failed:", e

    def __init__(self, basedir, options, install_type):
        self.basedir = basedir
        self.options = options
        self.install_type = install_type

    def _createLinks(self, arg):

        dst_directory = self.options.dst_dir
        src_directory = self.options.src_dir

        if not os.path.exists(dst_directory):
            os.makedirs(dst_directory)

        if self.options.verbose:
            print "Source Directory: %s" % src_directory
            print "Destination Directory: %s" % dst_directory

        src = os.path.join( src_directory, arg.src )
        dst = os.path.join( dst_directory, arg.dst )

        if self.options.verbose:
            print "src: %s, dst: %s" % (src, dst)
            print "ln -sf %s %s" % (src, dst)

        # remove existing Link
        if os.path.exists( dst ) or self.options.force:
            try:
                if self.options.verbose:
                    print "Removing Existing Link: %s" % ( dst )

                if not self.options.dry_run:
                    os.remove( dst )
            except OSError:
                pass

            # create new Link
            print "Creating Link: %s" % (dst)
            try:
                if self.options.verbose:
                    print "Creating Link: %s" % (dst)
                if not self.options.dry_run:
                    os.symlink( src, dst )
            except OSError:
                pass

    def _git(self, url, path):
        return "git clone %s %s" % (url,path)

    def createLinks(self):
        all_links = self.links()
        for k,v in all_links.items():
            for link in v:
                #link.pre_link_event += handler
                #link.post_link_event += handler

                #link.pre_link_event()
                self._createLinks(link)
                #link.post_link_event()

    def links(self):
        bin = LinkSet( Link('bin', 'bin') )

        gitconfig = ""
        offlineimap = ""
        signature = None
        msmtprc = None

        if self.HOME == self.install_type:
            gitconfig = 'dotfiles/gitconfig.HOME'
            offlineimap = 'dotfiles/offlineimaprc.HOME'
            msmtprc = 'msmtp/msmtprc.HOME'

        # TODO: move to pre-creation hook
        ssh_dir = os.path.join(self.options.dst_dir, ".ssh")
        if not os.path.exists(ssh_dir):
            os.makedir(ssh_dir)

        dotfiles = LinkSet(
            Link('dotfiles','.dotfiles'),
            Link('dotfiles/astylerc','.astylerc'),
            Link('dotfiles/git-prompt.conf','.git-prompt.conf'),
            Link('dotfiles/perltidy','.perltidy'),
            Link('dotfiles/screenrc','.screenrc'),
            Link('dotfiles/sqliterc','.sqliterc' ),
            Link('dotfiles/abcde.conf','.abcde.conf' ),
            Link( gitconfig,'.gitconfig'),
            Link('dotfiles/signature.HOME','.signature.home'),
            Link('dotfiles/ssh_config', '.ssh/config'),
            Link('dotfiles/login.sql', 'login.sql'),
            Link('dotfiles/git.scmbrc', '.git.scmbrc'),
            Link('dotfiles/perlcriticrc', '.perlcriticrc'),
            Link('dotfiles/scmbrc', '.scmbrc'),
            Link('dotfiles/offlineimap.py', '.offlineimap.py'),
            Link('dotfiles/Xresources', '.Xresources'),
            Link(offlineimap, '.offlineimaprc'),
            Link('dotfiles/xbindkeysrc','.xbindkeysrc'))

        # TODO: move to post-creation hook
        if not self.options.dry_run:
            pwd = self.options.src_dir
            input = os.path.join(pwd, "dotfiles/logrotate.conf")
            output_filename = os.path.join(self.options.dst_dir, ".logrotate.conf")
            if os.path.exists(output_filename):
                output = open(output_filename, "w+")
                output.write("\n")
            else:
                output = open(output_filename, "w")

            for line in fileinput.input(input):
                output.write(line.replace("$HOME", os.environ['HOME']))

        fonts = LinkSet(Link('fonts','.fonts'))

        mutt = LinkSet(
                Link('mutt','.mutt'),
                Link('mutt/muttrc','.muttrc'))

        msmtp = LinkSet(
                Link(msmtprc, '.msmtprc'),
                Link('msmtp/msmtp.authinfo.HOME.gpg','.msmtp.authinfo.home.gpg'))

        bash = LinkSet(
            Link('bash', '.bash'),
            Link('bash/bashrc','.bashrc'),
            Link('bash/inputrc','.inputrc'),
            Link('bash/bash_profile','.bash_profile'),
            Link('bash/bash_logout','.bash_logout'),
            Link('scm_breeze', '.scm_breeze'))

        emacs = LinkSet(Link('emacs','.emacs.d'))

        fish = LinkSet(Link('fish', '.config/fish'))

        i3 = LinkSet(Link('i3','.i3'))

        vim = LinkSet(Link('vim/vimrc.basic.vim','.vimrc'))

        # TODO: Add pre-link creation hook to clone repo
        vimpager = LinkSet(
            Link('vimpager/vimpager','bin/vimpager'),
            Link('vimpager/vimcat','bin/vimcat'))

        gnupg = LinkSet(Link('gnupg','.gnupg'))

        bazaar = LinkSet(Link('bazaar','.bazaar'))

        sublime_text = LinkSet(Link('sublime-text-3','.config/sublime-text-3'))

        zsh = LinkSet(Link('zsh','.zsh'),
            Link('oh-my-zsh', '.oh-my-zsh'),
            Link('zsh/zshrc', '.zshrc'),
            Link('zsh/zlogin', '.zlogin'))

        if self.HOME == self.install_type:
            procmail = LinkSet(
                Link('procmail/home','.procmail'),
                Link('procmail/home/procmailrc','.procmailrc'))
        else:
            procmail = None

        return {
            'bash' : bash,
            'bin' : bin,
            'dotfiles' : dotfiles,
            'emacs' : emacs,
            'fish' : fish,
            'fonts' : fonts,
            'gnupg' : gnupg,
            'i3' : i3,
            'mutt': mutt,
            'msmtp': msmtp,
            'procmail' : procmail,
            'sublime-text' : sublime_text,
            'vim' : vim,
            'zsh': zsh
        }

if __name__ == '__main__':
    sys.exit(run(sys.argv))
