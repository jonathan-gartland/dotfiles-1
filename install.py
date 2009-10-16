#!/usr/bin/env python

import sys, os.path, types

import enum

class install(object):

    procmail_type = enum.Enum('Home', 'Work')
    options = {}

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
        if len(options.keys()) == 0:
            self.options = { 'verbose': False, 'dry_run': False }
        else:
            if not self.options.has_key('verbose'):
                self.options['verbose'] = None
            if not options.has_key('dry_rune'):
                self.options['dry_run'] = None

        self.basedir = basedir
    
    def _createLinks(self, args):

        dst_directory = os.environ[ 'HOME' ]
        src_directory = os.getcwd()

        for arg in args:
                if self.options[ 'verbose' ]:
                    print "argument: %s" % arg
                src = os.path.join( src_directory, arg[ 'src' ] )
                dst = os.path.join( dst_directory, arg[ 'dst' ] )

                if self.options['verbose']:
                    print "src: %s, dst: %s" % (src,dst)

                if self.options['verbose']:
                        print "ln -sf %s %s" % ( src, dst )

                if os.path.exists( dst ):
                        if self.options['verbose']:
                                print "Removing Exsting Link: %s" % ( dst )

                        if not self.options['dry_run']:
                                try:
                                        os.remove( dst )
                                except OSError:
                                        pass

                        if self.options['verbose']:
                                print "Recreating Link: %s" % (dst)

                        try:
                                os.symlink( src, dst )
                        except OSError:
                                pass
                else:
                        print "Creating Link: %s" % (dst)
                        try:
                                os.symlink( src, dst )
                        except OSError:
                                pass
    def _git(self, url, path):
        return "git clone {0} {1}".format(url,path)

    def _bzr(self, url, path):
        return "bzr checkout {0} {1}".format(url, path)

    def bin(self):
        path = os.path.join(self.basedir, "bin", ".eg.git")
        if not os.path.exists(path):
            command = self._git("git://gitorious.org/eg/mainline.git", path)
            self._execute_command(command)
            self._execute_command("git ignore bin/.eg.git")
            self._execute_command("git ignore bin/eg")

        path = os.path.join(self.basedir, "bin", ".xask.git")
        if not os.path.exists(path):
            command = self._git("ssh://zathras.sr.unh.edu///dvcs/git/xask", path)
            self._execute_command(command)
            self._execute_command("git ignore bin/.cutpass.bzr")
            self._execute_command("git ignore bin/xask.py")

        path = os.path.join(self.basedir, "bin", ".cutpass.bzr")
        if not os.path.exists(path):
            command = self._bzr("sftp://q.sr.unh.edu/home/rea/data/bzr/cutpass/", path)
            self._execute_command(command)
            self._execute_command("git ignore bin/.cutpass.bzr")
            self._execute_command("git ignore bin/cutpass.py")
            self._execute_command("git ignore bin/qCutpass.py")

                
        self._createLinks([
            {'src': 'bin', 'dst': 'bin' },
            {'src': 'bin/.eg.git/eg', 'dst': 'bin/eg' },
            {'src': 'bin/.xask.git/xask.py', 'dst': 'bin/xask.py' },
            {'src': 'bin/.cutpass.bzr/cutpass.py', 'dst': 'bin/cutpass.py' },
            {'src': 'bin/.cutpass.bzr/qCutpass.py', 'dst': 'bin/qCutpass.py'}])

    def dotfiles(self):
        self._createLinks([{'src': 'dotfiles', 'dst': '.dotfiles' },
        { 'src': 'dotfiles/astylerc', 'dst': '.astylerc' },
        { 'src': 'dotfiles/screenrc', 'dst': '.screenrc' },
        { 'src': 'dotfiles/logrotate.conf', 'dst': '.logrotate.conf' },
        { 'src': 'dotfiles/muttrc', 'dst': '.muttrc' },
        { 'src': 'dotfiles/sqliterc', 'dst': '.sqliterc'  },
        { 'src': 'dotfiles/xbindkeysrc', 'dst': '.xbindkeysrc'  },
        { 'src' : 'dotfiles', 'dst' : '.zsh' },
        { 'src': 'dotfiles/zshrc', 'dst': '.zshrc' },
        { 'src': 'dotfiles/zshenv', 'dst': '.zshenv'},
        { 'src': 'dotfiles/zsh_prompt_termwide', 'dst': '.zsh_prompt_termwide'}])

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
            { 'src': 'vim', 'dst': ' .vim' },
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

    if len(sys.argv) != 2:
        print "%s: work|home|other" % __file__
        sys.exit(1)

    if sys.argv[1].upper() == "WORK":
         pt = install.procmail_type.Work
    elif sys.argv[1].upper() == "HOME":
         pt = install.procmail_type.Home
    else:
         pt = None

    basedir = os.path.dirname( os.path.dirname(os.path.abspath(__file__)) )
    installer = install(basedir, { 'verbose': True, 'dry_run': True })

    for key in install.__dict__.keys():
        if not key.startswith('_') and \
               type(install.__dict__[key]) == types.FunctionType:
            method = install.__dict__[key].__get__(installer, install)
            if key == "procmail":
                method(pt)
            else:
                method()
