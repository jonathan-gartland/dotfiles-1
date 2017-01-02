#!/usr/bin/env python2

import errno
import optparse
import os.path
import platform
import sys
from itertools import product
from subprocess import call


def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else:
            raise


def get_parser(arguments):
    usage = "usage: %prog [options] home|work|none"
    parser = optparse.OptionParser(usage=usage)

    parser.add_option("-v", "--verbose", dest="verbose", default=False,
                      help="Print lots of debugging ifno", action="store_true")
    parser.add_option("-n", "--dry-run", dest="dry_run", default=False,
                      help="Don't actually run any commands", action="store_true")

    (options, args) = parser.parse_args(args=arguments)
    return options, args, parser


def run(argv):
    (options, args, parser) = get_parser(argv)

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

    def _execute_command(self, command):
        try:
            if self.options.verbose:
                sys.stderr.write("command: {}\n".format(command))

            if self.options.dry_run:
                retcode = 0
            else:
                retcode = call(command, shell=True)
            if retcode < 0:
                print >> sys.stderr, "Child was terminated by signal", -retcode

        except OSError, e:
            print >> sys.stderr, "Execution failed:", e


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
        self.config_file = "install.conf.json"
        self.dotbot = os.path.join(self.base_dir,
                                   ".", ".dotbot", "bin", "dotbot")
        self.verbose = self.quiet = ''
        if options.verbose:
            self.verbose = '-v'
        else:
            self.quiet = '-q'
        self.dry_run = options.dry_run

    def _construct_cmd(self, os_type, install_type):
        config_file = self._config_file(os_type, install_type)

        if os.path.exists(config_file):
            cmd = "{dotbot} --base-directory {base_dir} --config-file {config_file} {quiet} {verbose}".format(
                dotbot=self.dotbot, base_dir=self.base_dir, config_file=config_file,
                quiet=self.quiet, verbose=self.verbose)
            return cmd
        else:
            return None

    def _config_file(self, os_type, install_type):
        os_type_prefix = self.config_files.get(os_type)
        install_type_prefix = self.config_files.get(install_type)

        prefixes = [install_type_prefix, os_type_prefix]
        prefixes = filter(None, prefixes)

        if prefixes:
            prefixes = '.'.join(prefixes)
            config_file = "{}.{}".format(prefixes, self.config_file)
        else:
            config_file = self.config_file

        return os.path.join(self.base_dir, 'dotbot', config_file)

    def run(self):
        configs = list(product([None, self.os_type], [None, self.install_type]))

        for os_type, install_type in configs:
            cmd = self._construct_cmd(os_type, install_type)
            if cmd:
                self._execute_command(cmd)


if __name__ == '__main__':
    sys.exit(run(sys.argv))
