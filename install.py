#!/usr/bin/env python2.7

import errno
import re
import os
import optparse
import os.path
import platform
import sys
from itertools import product

from contextlib import contextmanager
from subprocess import Popen, PIPE


def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


git_urls = [
    'git@github.com:zplug/zplug.git',
    'git@github.com:syl20bnr/spacemacs.git',
    'git@github.com:nojhan/liquidprompt.git',
    'git@github.com:amix/vimrc.git',
    'git@github.com:seebi/dircolors-solarized.git',
    'git@github.com:junegunn/vim-plug.git',
    'git@github.com:anishathalye/dotbot.git',
    'git@github.com:pyenv/pyenv.git',
    'git@github.com:pyenv/pyenv-doctor.git',
    'git@github.com:pyenv/pyenv-installer.git',
    'git@github.com:pyenv/pyenv-update.git',
    'git@github.com:pyenv/pyenv-virtualenv.git',
    'git@github.com:tmux-plugins/tpm.git',
    'git@github.com:petervanderdoes/gitflow.git',
    'git@github.com:petervanderdoes/git-flow-completion.git',
]

home_dir = os.getenv('HOME')

if home_dir is None:
    raise OSError("HOME env. variable must be set")

DEST_REPO_DIR = "{home_dir}/.repos".format(home_dir=home_dir)


def run_command(cmd, verbose):
    if verbose:
        print("Command: {cmd}".format(cmd=cmd))
    process = Popen(cmd.split(' '), stdout=PIPE, stderr=PIPE)
    p_stdout, p_stderr = process.communicate()

    if verbose:
        print(p_stdout.decode('UTF-8'))

    p_stderr = p_stderr.decode('UTF-8')
    return process.returncode, p_stderr


def get_parser(arguments):
    usage = "usage: %prog [options] home|work|none"
    parser = optparse.OptionParser(usage=usage)

    parser.add_option("-v", "--verbose", dest="verbose", default=False,
                      help="Print lots of debugging info", action="store_true")
    parser.add_option("-n", "--dry-run", dest="dry_run", default=False,
                      help="Don't actually run any commands", action="store_true")
    parser.add_option('-c', "--git_clone", dest='git_clone', default=False, action='store_true',
                      help="Clone all URLS to {DEST_REPO_DIR}".format(DEST_REPO_DIR=DEST_REPO_DIR))
    parser.add_option('-u', "--git_update", dest='git_update', default=False, action='store_true',
                      help="Update all URLS to {DEST_REPO_DIR}".format(DEST_REPO_DIR=DEST_REPO_DIR))

    (options, args) = parser.parse_args(args=arguments)
    return options, args, parser


@contextmanager
def working_directory(path):
    prev_cwd = os.getcwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(prev_cwd)


def parse_git_url(git_url):
    git_url_regex = re.compile('.*:.*/([-\w]*)\.git')
    mo = git_url_regex.match(git_url)
    if mo:
        return mo.group(1)
    else:
        raise ValueError("No regex match against git_url {git_url}".format(git_url=git_url))


def clone_repo(name, git_url, opts):
    with working_directory(DEST_REPO_DIR):
        if opts.verbose:
            print("Cloning {name} at {git_url}".format(name=name, git_url=git_url))

        cmd = "git clone {git_url}".format(git_url=git_url)
        if opts.dry_run:
            print("Command: {cmd}".format(cmd=cmd))
            return

        error_code, stderr = run_command(cmd, verbose=opts.verbose)
        if error_code > 0:
            raise OSError("cloning of git repo {git_url} failed; "
                          "error: {stderr}".format(git_url=git_url, stderr=stderr))
        else:
            print("Cloned: {name}".format(name=name))


def update_repo(name, git_dir, git_url, opts):
    with working_directory(git_dir):
        cmd = "git pull"
        if opts.verbose:
            print("Updating {name} at {git_url}".format(name=name, git_url=git_url))

        if opts.dry_run:
            print("Command: {cmd}".format(cmd=cmd))
            return

        error_code, stderr = run_command(cmd, verbose=opts.verbose)
        if error_code > 0:
            raise OSError("Updating of git repo {git_url} failed; error: {stderr}".format(
                git_url=git_url, stderr=stderr
            ))
        else:
            print("Updated: {name}".format(name=name))


def clone_repos(opts):
    for git_url in git_urls:
        try:
            name = parse_git_url(git_url)
        except ValueError as e:
            print("Error: {error}".format(error=e))
        else:
            git_dir = os.path.join(DEST_REPO_DIR, name)
            if os.path.exists(git_dir):
                print("{name} already exists skipping".format(name=name))
            else:
                clone_repo(name, git_url, opts)


def update_repos(opts):
    for git_url in git_urls:
        try:
            name = parse_git_url(git_url)
        except ValueError as e:
            print(e)
        else:
            git_dir = os.path.join(DEST_REPO_DIR, name)
            if os.path.exists(git_dir):
                update_repo(name, git_dir, git_url, opts)
            else:
                print("{name} does not exists clone".format(name=name))
                clone_repo(name, git_url, opts)


def run(argv):
    (options, args, parser) = get_parser(argv)

    mkdir_p(DEST_REPO_DIR)

    if options.git_clone:
        clone_repos(options)

    if options.git_update:
        update_repos(options)

    if len(argv) < 2:
        parser.print_help()
        return 1

    Links(argv, options).run()

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


class Links(InstallBase):
    def __init__(self, argv, options):
        super(Links, self).__init__(argv, options)

        self.base_dir = os.getcwd()
        self.config_files = {
            InstallBase.WORK: "work",
            InstallBase.HOME: "home",
            InstallBase.OSX: "osx",
            InstallBase.LINUX: "linux",
            InstallBase.WINDOWS: "windows",
            None: None
        }
        self.config_file = "install.conf.yaml"
        self.dotbot = os.path.join(DEST_REPO_DIR, "dotbot", "bin", "dotbot")
        self.verbose = self.quiet = ''
        if options.verbose:
            self.verbose = '-v'
        else:
            self.verbose = '-q'
        self.dry_run = options.dry_run

    def _construct_cmd(self, os_type, install_type):
        config_file = self._config_file(os_type, install_type)

        if os.path.exists(config_file):
            cmd = "{dotbot} -d {base_dir} -c {config_file} " \
                  "{verbose}".format(dotbot=self.dotbot,
                                     base_dir=self.base_dir,
                                     config_file=config_file,
                                     verbose=self.verbose)
            return cmd.strip()
        else:
            return None

    def _config_file(self, os_type, install_type):
        os_type_prefix = self.config_files.get(os_type)
        install_type_prefix = self.config_files.get(install_type)

        prefixes = [install_type_prefix, os_type_prefix]
        prefixes = list(filter(None, prefixes))

        if prefixes:
            prefixes = '.'.join(prefixes)
            config_file = "{}.{}".format(prefixes, self.config_file)
        else:
            config_file = self.config_file

        return os.path.join(self.base_dir, 'dotbot', config_file)

    def run(self):
        configs = list(product([None, self.os_type],
                               [None, self.install_type]))

        extra_configs = ['pyenv', self.os_type, self.install_type]
        for extra_config in extra_configs:
            configs.append([None, extra_config])

        for os_type, install_type in configs:
            cmd = self._construct_cmd(os_type, install_type)
            if cmd:
                return_code, stderr = run_command(cmd, self.verbose)
                if return_code > 0:
                    print("Error: {stderr}".format(stderr=stderr))


if __name__ == '__main__':
    sys.exit(run(sys.argv))
