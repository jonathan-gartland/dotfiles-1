# encoding: utf-8

require 'pp'
require 'logger'

require 'mixlib/cli'
require 'mixlib/log'

require 'installer/version'
require 'installer/install'

DST_DIR = ENV['HOME']
SRC_DIR = File.absolute_path(File.join(Dir.getwd, '..'))

module Installer
  # [todo] - Add top-level class documentation comment.
  class CommandParser
    include Mixlib::CLI

    option :dry_run,
           short: '-n',
           long: '--dry-run',
           description: 'Perform a trial run with no changes made',
           required: false,
           boolean: true,
           default: false

    # option :verbose,
    #        short: '-v',
    #        long: '--verbose',
    #        description: 'Print lots of debugging information',
    #        required: false,
    #        boolean: true,
    #        default: false

    option :force,
           short: '-f',
           long: '--force',
           description: 'Ignore existing files/directories',
           required: false,
           boolean: true,
           default: false

    option :dst_dir,
           short: '-d DST_DIR',
           long: '--dst-dsr DST_DIR',
           description: "destination base directory (default: #{DST_DIR})",
           required: true,
           boolean: false,
           default: DST_DIR

    option :src_dir,
           short: '-s SRC_DIR',
           long: '--src-dir SRC_DIR',
           description: "source base directory (default: #{SRC_DIR})",
           required: true,
           default: SRC_DIR,
           boolean: false

    option :log_level,
           short: '-l LEVEL',
           long: '--log_level LEVEL',
           description: 'Set the log level: debug, info (default), warn,' +
                        'error, fatal' ,
           required: false

    option :install_type,
           short: '-t INSTALL_TYPE',
           long: '--install-type INSTALL_TYPE',
           description: 'Set the install type: home, work',
           required: true,
           proc: proc { |l| l.to_sym }

    option :version,
           short: '-V',
           long: '--version',
           description: 'version',
           boolean: false,
           proc: proc { puts "Installer: #{Installer::Version::VERSION}\n" },
           exit: 0

    option :help,
           short: '-h',
           long: '--help',
           description: 'Help',
           on: :tail,
           boolean: true,
           show_options: true,
           exit: 0
  end

  # [todo] - Add top-level class documentation comment.
  class CLI
    def self.execute(argv)
      cli = CommandParser.new
      cli.parse_options(argv)

      if cli.config[:log_level].nil?
        cli.config[:log_level] = :info
      end
      Installer::Log::level(cli.config[:log_level].to_sym)
      Installer::Install.new(cli.config).create_links
    end
  end
end
