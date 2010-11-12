#!/usr/bin/env python

import sys, os.path, types, optparse, fileinput

def get_parser(arguments):
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

def run(argv):
    (options, args, parser) = get_parser(argv)



    if len(argv) < 2:
        parser.print_help()
        return 1

    if args[1].upper() == "WORK":     install_type = install.WORK
    elif args[1].upper() == "HOME":   install_type = install.HOME
    else:                             install_type = None

    basedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    installer = install(basedir, options)

    for key in install.__dict__.keys():
        if not key.startswith('_') and \
               type(install.__dict__[key]) == types.FunctionType:
            method = install.__dict__[key].__get__(installer, install)
            method(install_type)

    return 0

class install(object):

    WORK = 1
    HOME = 2

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

        if self.options.verbose:
            print "Source Directory: %s" % src_directory
            print "Destination Directory: %s" % dst_directory

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
        return "git clone %s %s" % (url,path)

    def _bzr(self, url, path):
        return "bzr checkout %s %s" % (url, path)

    def bin(self, install_type):
        if not self.options.dry_run:
            path = os.path.join(self.basedir, "bin", ".cutpass.bzr")
            if not os.path.exists(path):
                self._execute_command(self._bzr("sftp://skk@q.sr.unh.edu/home/rea/data/bzr/cutpass/", path))

        self._createLinks([
                {'src': 'bin', 'dst': 'bin' },
                {'src': 'bin/.cutpass.bzr/cutpass.py', 'dst': 'bin/cutpass' },
                {'src': 'bin/.cutpass.bzr/qCutpass.py', 'dst': 'bin/qCutpass'}
        ])

    def dotfiles(self, install_type):
        gitconfig = ""

        if self.WORK == install_type:
            gitconfig = 'dotfiles/gitconfig.WORK'

        if self.HOME == install_type:
            gitconfig = 'dotfiles/gitconfig.HOME'

        self._createLinks([{'src': 'dotfiles', 'dst': '.dotfiles' },
        { 'src': 'dotfiles/astylerc', 'dst': '.astylerc' },
        { 'src': 'dotfiles/screenrc', 'dst': '.screenrc' },
        { 'src': 'dotfiles/muttrc', 'dst': '.muttrc' },
        { 'src': 'dotfiles/sqliterc', 'dst': '.sqliterc'  },
        { 'src': gitconfig, 'dst': '.gitconfig' },                           
        { 'src': 'dotfiles/xbindkeysrc', 'dst': '.xbindkeysrc'  }])

        if not self.options.dry_run:
            #pwd = os.path.dirname(os.path.abspath(__file__))
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

    def zsh(self, install_type):
        self._createLinks([
        { 'src': 'zsh', 'dst' : '.zsh' },
        { 'src': 'zsh/zshrc', 'dst': '.zshrc' },
        { 'src': 'zsh/zprofile', 'dst': '.zprofile' },
        { 'src': 'zsh/zlogout', 'dst': '.zlogout' }])

    def emacs(self, install_type):
        self._createLinks([
        {'src': 'emacs', 'dst': '.emacs.d' },
        {'src': 'emacs/emacs.el', 'dst': '.emacs' },
        {'src': 'emacs/autoload/skk-wanderlust.el', 'dst': '.wl' },
        {'src': 'emacs/init/skk-wanderlust-folders.el', 'dst': '.folders' }])

    def fish(self, install_type):
        self._createLinks([
        {'src': 'fish', 'dst': '.fish' },
        {'src': 'fish/config.fish', 'dst' : '.fishrc' },
        {'src': 'fish/', 'dst': '.config/fish' }])

    def vim(self, install_type):
        self._createLinks([
            { 'src': 'vim', 'dst': '.vim' },
            { 'src': 'vim/vimrc', 'dst': '.vimrc' }])

    def gnupg(self, install_type):
        self._createLinks([
            {'src': 'gnupg', 'dst': '.gnupg'}
            ])

    def procmail(self, install_type):
        if self.WORK == install_type:
            self._createLinks([
                {'src': 'procmail/work', 'dst': '.procmail' },
                {'src': 'procmail/work/procmailrc', 'dst': '.procmailrc' }])

        if self.HOME == install_type:
            self._createLinks([
                {'src': 'procmail/home', 'dst': '.procmail' },
                {'src': 'procmail/home/procmailrc', 'dst': '.procmailrc' }])

