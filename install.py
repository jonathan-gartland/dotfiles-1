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

    def _execute_command(self, command):
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
            self._createLinks([ {'src': 'bin',
                                 'dst': 'bin' } ])

    def dotfiles(self, install_type):
        gitconfig = ""
        offlineimap = ""
        signature = None

        if install_type == None:
            gitconfig = 'dotfiles/gitconfig.NONE'

        if self.WORK == install_type:
            gitconfig = 'dotfiles/gitconfig.WORK'
            offlineimap = 'dotfiles/offlineimaprc.WORK'

        if self.HOME == install_type:
            gitconfig = 'dotfiles/gitconfig.HOME'
            offlineimap = 'dotfiles/offlineimaprc.HOME'

        ssh_dir = os.path.join(self.options.dst_dir, ".ssh")
        if not os.path.exists(ssh_dir):
            os.makedir(ssh_dir)

        self._createLinks([{'src': 'dotfiles', 'dst': '.dotfiles' },
        { 'src': 'dotfiles/astylerc', 'dst': '.astylerc' },
        { 'src': 'dotfiles/git-prompt.conf', 'dst': '.git-prompt.conf' },
        { 'src': 'dotfiles/perltidy', 'dst': '.perltidy' },
        { 'src': 'dotfiles/screenrc', 'dst': '.screenrc' },
        { 'src': 'dotfiles/muttrc', 'dst': '.muttrc' },
        { 'src': 'dotfiles/sqliterc', 'dst': '.sqliterc'  },
        { 'src': 'dotfiles/abcde.conf', 'dst': '.abcde.conf'  },
        { 'src':  gitconfig, 'dst': '.gitconfig' },
        { 'src': 'dotfiles/signature.HOME', 'dst': '.signature.home' },
        { 'src': 'dotfiles/signature.WORK', 'dst': '.signature.work' },
        { 'src': 'dotfiles/signature.WORK.HTML', 'dst': '.signature.work.html' },
        { 'src': 'dotfiles/authinfo.HOME.gpg', 'dst': '.authinfo.home' },
        { 'src': 'dotfiles/authinfo.WORK.gpg', 'dst': '.authinfo.work' },
        { 'src': 'dotfiles/ssh_config', 'dst' : '.ssh/config'},
        { 'src': 'dotfiles/login.sql', 'dst' : 'login.sql'},
        { 'src': 'dotfiles/git.scmbrc', 'dst' : '.git.scmbrc'},
        { 'src': 'dotfiles/perlcriticrc', 'dst' : '.perlcriticrc'},
        { 'src': 'dotfiles/scmbrc', 'dst' : '.scmbrc'},
        { 'src': 'dotfiles/offlineimap.py', 'dst' : '.offlineimap.py'},
        { 'src': 'dotfiles/Xresources', 'dst' : '.Xresources'},
        { 'src': offlineimap, 'dst' : '.offlineimaprc'},
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

    def fonts(self, install_type):
            self._createLinks([{ 'src': 'fonts', 'dst': '.fonts' } ])

    def terminator(self, install_type):
            self._createLinks([{ 'src': 'terminator', 'dst': '.config/terminator' } ])

    def lilyterm(self, install_type):
            self._createLinks([{ 'src': 'lilyterm', 'dst': '.config/lilyterm' } ])

    def awesome(self, install_type):
        self._createLinks(
            [{
                'src': 'awesome',
                'dst': '.config/awesome'
            }]
        )
    def rxvt(self, install_type):
        self._createLinks(
            [{
                'src': 'rxvt',
                'dst': '.rxvt'
            }]
        )

    def bash(self, install_type):
        self._createLinks([
        { 'src': 'bash', 'dst' : '.bash' },
        { 'src': 'bash/bashrc', 'dst': '.bashrc' },
        { 'src': 'bash/inputrc', 'dst': '.inputrc' },
        { 'src': 'bash/bash_profile', 'dst': '.bash_profile' },
        { 'src': 'bash/bash_logout', 'dst': '.bash_logout' },
        { 'src': 'scm_breeze', 'dst' : '.scm_breeze' },])


    def emacs(self, install_type):
        self._createLinks([{'src': 'emacs', 'dst': '.emacs.d'}])

    def ffind(self, install_type):
        self._createLinks([{'src': 'friendly-find/ffind', 'dst': 'bin/ffind'}])

    def i3(self, install_type):
        self._createLinks([{'src': 'i3', 'dst': '.i3'}])

    def clojure(self, install_type):
        self._createLinks([
                {'src': 'lein', 'dst': '.lein'},
                {'src': 'cljr', 'dst': '.cljr'},
                {'src': 'm2', 'dst': '.m2'}])

    def vim(self, install_type):
        self._createLinks([
            # { 'src': 'vimrc', 'dst': '.vim_runtime' },
            # { 'src': 'vim/vimrc', 'dst': '.vimrc' },
            { 'src': 'vimrc.local', 'dst': '.vimrc.local'},
            { 'src': 'vimrc.bundles.local', 'dst': '.vimrc.bundles.local'},
        ])

    def vimpager(self, install_type):
        self._createLinks([
            {'src': 'vimpager/vimpager', 'dst': 'bin/vimpager'},
            {'src': 'vimpager/vimcat', 'dst': 'bin/vimcat'},
        ])

    def gnupg(self, install_type):
        self._createLinks([
            {'src': 'gnupg', 'dst': '.gnupg'}
            ])

    def bazaar(self, install_type):
        self._createLinks([
            {'src': 'bazaar', 'dst': '.bazaar'}
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

if __name__ == '__main__':
    sys.exit(run(sys.argv))
