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

    parser.add_option("-v", "--verbose", dest="verbose", default=False,
        help="Print lots of debugging information",
        action="store_true")

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

    platform_system = platform.system()

    if platform_system.startswith('Darwin'):
        os_type = install.OSX
    elif platform_system.startswith('Linux'):
        os_type = install.LINUX
    elif platform_system.startswith('Windows'):
        os_type = install.WINDOWS
    else:
        os_type = None

    install(install_type, os_type, options.verbose).run()

    return 0

class install(object):

    WORK = 1
    HOME = 2
    OSX = 3
    LINUX = 4
    WINDOWS = 5

    def __init__(self, install_type, os_type, verbose):
        self.install_type = install_type
        self.os_type = os_type
        self.base_dir = os.path.join(os.environ['HOME'], 'dot-files-forest', 'dotbot')
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
        if verbose:
            self.verbose = '-v'
        else:
            self.quiet = '-q'

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

        return os.path.join(self.base_dir, config_file)

    def run(self):
        commands = [
            self._construct_cmd(None),
            self._construct_cmd(self.os_type),
            self._construct_cmd(self.install_type),
        ]

        for cmd in commands:
            print "command: %s" % cmd
            self._execute_command(cmd)

    def _execute_command(self, command):
        try:
            retcode = call(command, shell=True)
            if retcode < 0:
                print >>sys.stderr, "Child was terminated by signal", -retcode

        except OSError, e:
                print >>sys.stderr, "Execution failed:", e


if __name__ == '__main__':
    sys.exit(run(sys.argv))
