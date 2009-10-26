#!/usr/bin/env python

import sys, os.path, types, optparse

import enum

def parser(arguments):
    usage = "usage: %prog [options] other|home|work"
    parser = optparse.OptionParser(usage = usage)

    parser.add_option("-v", "--verbose", dest="verbose",  default=False,
                      help="Print lots of debugging information",  action="store_true")
    parser.add_option("-n", "--dry-run", dest="dry_run", default=False,
                      help="Don't actually run any commands; just print them.",  action="store_true")
    parser.add_option("-f", "--force", dest="force", default=False,
                      help="Ignore existing files/directories.", action="store_true")
    parser.add_option("-d", "--dst_dir", dest="dst_dir", default=os.environ['HOME'],
                      help="Set destination base directory (defaulting to: %s)" % os.environ['HOME'],
                      action="store")
    parser.add_option("-s", "--src_dst", dest="src_dir", default=os.getcwd(),
                      help="Set source base directory (defaulting to: %s)" % os.getcwd(),
                      action="store")

    (options, args) = parser.parse_args(args = arguments)
    return (options, args, parser)

class install(object):

    procmail_type = enum.Enum('Home', 'Work')

    def _execute_command(self, command ):
        from subprocess import call
        from sys import stderr
        try:
            retcode = call(command, shell=True)
            if retcode < 0:
                print >>stderr, "Child was terminated by signal", -retcode

        except OSError, e:
                print >>stderr, "Execution failed:", e

    def __init__(self, basedir, options):
        self.basedir = basedir
        self.options = options

    def _createLinks(self, args):

        dst_directory = self.options.dst_dir
        src_directory = self.options.src_dir

        if not os.path.exists(dst_directory):
            os.makedirs(dst_directory)

        for arg in args:
           src = os.path.join( src_directory, arg[ 'src' ] )
           dst = os.path.join( dst_directory, arg[ 'dst' ] )

           if self.options.verbose:
               print "argument: %s" % arg
               print "src: %s, dst: %s" % (src,dst)
               print "ln -sf %s %s" % ( src, dst )

           # remove existing Link
           if os.path.exists( dst ) or self.options.force:
               try:
                   if self.options.verbose:
                       print "Removing Exsting Link: %s" % ( dst )

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
        return "git clone {0} {1}".format(url,path)

    def _bzr(self, url, path):
        return "bzr checkout {0} {1}".format(url, path)

    def bin(self):
        if not self.options.dry_run:
            path = os.path.join(self.basedir, "bin", ".eg.git")
            if not os.path.exists(path):
                self._execute_command(self._git("git://gitorious.org/eg/mainline.git", path))

            path = os.path.join(self.basedir, "bin", ".xask.git")
            if not os.path.exists(path):
                self._execute_command(self._git("ssh://zathras.sr.unh.edu///dvcs/git/xask", path))

            path = os.path.join(self.basedir, "bin", ".cutpass.bzr")
            if not os.path.exists(path):
                self._execute_command(self._bzr("sftp://q.sr.unh.edu/home/rea/data/bzr/cutpass/", path))

        self._createLinks([
                {'src': 'bin', 'dst': 'bin' },
                {'src': 'bin/.eg.git/eg', 'dst': 'bin/eg' },
                {'src': 'bin/.xask.git/xask.py', 'dst': 'bin/xask.py' },
                {'src': 'bin/.cutpass.bzr/cutpass.py', 'dst': 'bin/cutpass' },
                {'src': 'bin/.cutpass.bzr/qCutpass.py', 'dst': 'bin/qCutpass'}
        ])

    def dotfiles(self):
        self._createLinks([{'src': 'dotfiles', 'dst': '.dotfiles' },
        { 'src': 'dotfiles/astylerc', 'dst': '.astylerc' },
        { 'src': 'dotfiles/screenrc', 'dst': '.screenrc' },
        { 'src': 'dotfiles/logrotate.conf', 'dst': '.logrotate.conf' },
        { 'src': 'dotfiles/muttrc', 'dst': '.muttrc' },
        { 'src': 'dotfiles/sqliterc', 'dst': '.sqliterc'  },
        { 'src': 'dotfiles/xbindkeysrc', 'dst': '.xbindkeysrc'  }])

    def zsh(self):
        self._createLinks([
        { 'src': 'zsh', 'dst' : '.zsh' },
        { 'src': 'zsh/zshrc', 'dst': '.zshrc' },
        { 'src': 'zsh/zprofile', 'dst': '.zprofile' },
        { 'src': 'zsh/zlogout', 'dst': '.zlogout' }])

    def emacs(self):
        self._createLinks([
        {'src': 'emacs', 'dst': '.emacs.d' },
        {'src': 'emacs/emacs.el', 'dst': '.emacs' },
        {'src': 'emacs/viper.el', 'dst': '.viper' },
        {'src': 'emacs/init/skk-wanderlust.el', 'dst': '.wl' },
        {'src': 'emacs/init/skk-wanderlust-folders.el', 'dst': '.folders' }])

    def fish(self):
        self._createLinks([
        {'src': 'fish', 'dst': '.fish' },
        {'src': 'fish/config.fish', 'dst' : '.fishrc' },
        {'src': 'fish/', 'dst': '.config/fish' }])

    def vim(self):
        self._createLinks([
            { 'src': 'vim', 'dst': '.vim' },
            { 'src': 'vim/vimrc', 'dst': '.vimrc' }])

    def procmail(self, type):
        if self.procmail_type.Work == type:
            self._createLinks([
                {'src': 'procmail/work', 'dst': '.procmail' },
                {'src': 'procmail/work/procmailrc', 'dst': '.procmailrc' }])

        if self.procmail_type.Home == type:
            self._createLinks([
                {'src': 'procmail/home', 'dst': '.procmail' },
                {'src': 'procmail/home/procmailrc', 'dst': '.procmailrc' }])

if __name__ == '__main__':

    (options, args, parser) = parser(sys.argv)

    if len(sys.argv) < 2:
        parser.print_help()
        sys.exit(1)

    if sys.argv[1].upper() == "WORK":     pt = install.procmail_type.Work
    elif sys.argv[1].upper() == "HOME":   pt = install.procmail_type.Home
    else:                                 pt = None

    basedir = os.path.dirname( os.path.dirname(os.path.abspath(__file__)) )
    installer = install(basedir, options)

    for key in install.__dict__.keys():
        if not key.startswith('_') and \
               type(install.__dict__[key]) == types.FunctionType:
            method = install.__dict__[key].__get__(installer, install)
            if key == "procmail":
                method(pt)
            else:
                method()
