#!/usr/bin/env python2

import sys, os.path, optparse, fileinput
from subprocess import call
import os, errno, platform
from collections import OrderedDict

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

    default_base_dir = os.getenv('HOME')

    parser.add_option('-d', '--base_dir', dest='base_dir', default=default_base_dir,
                      help='Base directory, default: ' + default_base_dir,
                      action='store')

    parser.add_option('-c', '--clone_repos', dest='clone_repos', default=False,
                      help='Clone all repos', action='store_true')
    parser.add_option('-u', '--update_repos', dest='update_repos', default=False,
                      help='Update all repos', action='store_true')

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
       Links(argv, options).run()
    elif options.clone_repos or options.update_repos:
        Repos(argv, options).run()
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
            if self.options.verbose:
                sys.stderr.write("command: {}\n".format(command))

            if self.options.dry_run:
                retcode = 0
            else:
                retcode = call(command, shell=True)
            if retcode < 0:
                print >>sys.stderr, "Child was terminated by signal", -retcode

        except OSError, e:
                print >>sys.stderr, "Execution failed:", e

import os

class ChDir(object):
    """
    Step into a directory temporarily.
    """
    def __init__(self, path):
        self.old_dir = os.getcwd()
        self.new_dir = path
    def __enter__(self):
        os.chdir(self.new_dir)

    def __exit__(self, *args):
        os.chdir(self.old_dir)

class Repos(InstallBase):

    def __init__(self, argv, options):
        super(Repos, self).__init__(argv, options)
        self.base_dir = options.base_dir

        self.repos = OrderedDict({
            'dot-files-forest': 'git@bitbucket.org:skknight/dot-files-forest.git',
            'LS_COLORS': 'git@github.com:trapd00r/LS_COLORS.git',
	        'antigen': 'git@github.com:zsh-users/antigen.git',
	        'tpm': 'git@github.com:tmux-plugins/tpm.git',
	        'hammerspoon-config': 'git@github.com:Linell/hammerspoon-config.git',
	        'dotbot': 'git@github.com:skk/dotbot.git',
	        'spacemacs': 'git@github.com:syl20bnr/spacemacs.git',
	        'smartcd': 'git@github.com:cxreg/smartcd.git',
	        'liquidprompt': 'git@github.com:nojhan/liquidprompt.git',
	        'vimrc': 'git@github.com:amix/vimrc.git',
        })

    def clone_git_repo(self, repo_name, repo_branch, repo_path):
        print repo_name
        self._execute_command("git clone {repo_path} --branch={repo_branch} --recurse-submodules".format(repo_branch=repo_branch, repo_path=repo_path))

    def update_git_repo(self, repo_name):
        print repo_name
        self._execute_command('git pull')

    def update_submodule_git_repo(self, repo_name):
        print '\n' + repo_name
        self._execute_command('git submodule update --recursive')

    def run(self):
        mkdir_p(self.base_dir)

        for repo_name, repo_url in self.repos.iteritems():
            if self.options.clone_repos:
                if repo_name == 'dot_files_forest':
                    repo_path = os.path.join(self.base_dir , repo_name)
                    repo_branch = 'develop'
                else:
                    repo_path = os.path.join(self.base_dir, 'src', repo_name)
                    repo_branch = 'master'

                mkdir_p(repo_path)
                with ChDir(repo_path):
                    self.clone_git_repo(repo_name, repo_branch, repo_url)

            if self.options.update_repos:
                if repo_name != 'dot_files_forest':
                    repo_dir = os.path.join(self.dst_dir, repo_name)
                    with ChDir(repo_dir):
                        self.update_git_repo(repo_name)
                        self.update_submodule_git_repo(repo_name)

class Links(InstallBase):

    def __init__(self, argv, options):
        super(Links, self).__init__(argv, options)

        self.base_dir = os.path.join(options.base_dir, 'dot-files-forest')
        self.config_files = {
            InstallBase.WORK: "work",
            InstallBase.HOME: "home",
            InstallBase.OSX: "osx",
            InstallBase.LINUX: "linux",
            InstallBase.WINDOWS: "windows",
            None: None
        }
        self.config_file = "install.conf.json"
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
            self._execute_command(cmd)

if __name__ == '__main__':
    sys.exit(run(sys.argv))
