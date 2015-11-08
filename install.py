#!/usr/bin/env python2

import sys, os.path, optparse, fileinput
from subprocess import call
import os, errno, platform

def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc: # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else: raise

def get_parser(arguments):
    usage = "usage: %prog [options] home|work|none"
    parser = optparse.OptionParser(usage = usage)

    parser.add_option('-b', '--bootstrap', dest='bootstrap', default=False,
                      help='Download all required repos', action='store_true')
    parser.add_option('-l', '--links', dest='links', default=False,
                      help='Create all links', action='store_true')

    parser.add_option("-v", "--verbose", dest="verbose", default=False,
                      help="Print lots of debugging information",
                      action="store_true")
    parser.add_option("-n", "--dry-run", dest="dry_run", default=False,
                      help="Don't actually run any commands; just print them.",
                      action="store_true")

    (options, args) = parser.parse_args(args = arguments)
    return (options, args, parser)

def run(argv):
    (options, args, parser) = get_parser(argv)

    if len(argv) < 2:
        parser.print_help()
        return 1

    if options.links:
       links(argv, options).run()
    elif options.bootstrap:
        bootstrap(argv, options).run()
    else:
        raise ValueError("Need either option links or bootstrap")

    return 0

class InstallBase(object):

    WORK = 1
    HOME = 2
    NONE = 3

    OSX = 4
    LINUX = 5
    WINDOWS = 6

    def __init__(self, argv, options):
        self.argv = argv
        self.options = options

        # TODO: convert to dict syntax
        if self.argv[1].upper() == "WORK":
            self.install_type = InstallBase.WORK
        elif self.argv[1].upper() == "HOME":
            self.install_type = InstallBase.HOME
        else:
            self.install_type = InstallBase.NONE

        # TODO: convert to dict syntax
        platform_system = platform.system()
        if platform_system.startswith('Darwin'):
            self.os_type = InstallBase.OSX
        elif platform_system.startswith('Linux'):
            self.os_type = InstallBase.LINUX
        elif platform_system.startswith('Windows'):
            self.os_type = InstallBase.WINDOWS
        else:
            self.os_type = None

    def run(self):
        raise NotImplementedError

    def _execute_command(self, command):
        try:
            retcode = call(command, shell=True)
            if retcode < 0:
                print >>sys.stderr, "Child was terminated by signal", -retcode

        except OSError, e:
                print >>sys.stderr, "Execution failed:", e

class bootstrap(InstallBase):

    def __init__(self, argv, options):
        super(bootstrap, self).__init__(argv, options)

        self.repos = [
            'git@github.com:trapd00r/LS_COLORS.git',
	        'git@github.com:zsh-users/antigen.git',
	        'git@github.com:tmux-plugins/tpm.git',
	        'git@github.com:Linell/hammerspoon-config.git',
	        'git@github.com:skk/dotbot.git',
	        'git@github.com:syl20bnr/spacemacs.git',
	        'git@github.com:cxreg/smartcd.git',
	        'git@github.com:nojhan/liquidprompt.git',
	        'git@github.com:amix/vimrc.git',
        ]

    def clone_git_repo(self, repo):
        self._execute_command("git clone {repo} --recurse-submodules".
                              format(repo=repo))
    def run(self):
        for repo in self.repos:
            self.clone_git_repo(repo)

class links(InstallBase):

    def __init__(self, argv, options):
        super(links, self).__init__(argv, options)

        self.base_dir = os.path.join(os.environ['HOME'], 'dot-files-forest')
        self.config_files = {
            install.WORK: "work",
            install.HOME: "home",
            install.OSX: "osx",
            install.LINUX: "linux",
            install.WINDOWS: "windows",
            None: None
        }
        self.config_file = "install.conf.yaml"
        self.dotbot = "~/src/dotbot/bin/dotbot"
        self.verbose = self.quiet = ''
        if options.verbose:
            self.verbose = '-v'
        else:
            self.quiet = '-q'
        self.dry_run = options.dry_run

    def _construct_cmd(self, config_file):
        config_file = self._config_file(config_file)
        cmd = "{dotbot} --base-directory {base_dir} --config-file {config_file} {quiet} {verbose}".format(
            dotbot=self.dotbot, base_dir=self.base_dir, config_file=config_file,
            quiet=self.quiet, verbose=self.verbose)
        return cmd

    def _config_file(self, config_file_type):
        config_file_prefix = self.config_files.get(config_file_type)

        if config_file_prefix is None:
            config_file = self.config_file
        else:
            config_file = "{}.{}".format(config_file_prefix, self.config_file)

        return os.path.join(self.base_dir, 'dotbot', config_file)

    def run(self):
        commands = [
            self._construct_cmd(None),
            self._construct_cmd(self.os_type),
            self._construct_cmd(self.install_type),
        ]

        for cmd in commands:
            print "command: %s" % cmd
            if not self.dry_run:
                self._execute_command(cmd)

if __name__ == '__main__':
    sys.exit(run(sys.argv))
