# encoding: utf-8

require "docopt"

require 'installer/version'
require 'installer/install'
require 'installer/log'

module Installer
  # This class provides the command line interface for Installer.
  class CLI
    include Installer::Logging

    attr_accessor :filename
    attr_reader :srcdir
    attr_reader :dstdir

    def initialize(filename)
      @filename = filename
      @dstdir = ENV['HOME']
      @srcdir = File.absolute_path(File.join(Dir.getwd, '..'))
    end

    def docopt(filename, srcdir, dstdir)
    #[-s SRC_DIR | --src-dir=SRC_DIR] | [-d DST_DIR | --dst-dir=DST_DIR] ]
    #-d DST_DIR, --dst-dir=DST_DIR     destination base directory (default: #{dstdir})
    #-s SRC_DIR, --src-dir=SRC_DIR     source base directory (default: #{srcdir})
doc = <<DOCOPT
Usage:
  #{filename} [options] <INSTALL_TYPE>

Options:
    -n, --dry-run             Perform a trial run with no changes made
    -f, --force               Ignore existing files/directories
    -q, --quiet               Suppress output
    -v, --verbose             Output extra information
    --version                 Version
    -h, --help                Help

INSTALL_TYPE: HOME | WORK | home | work

DOCOPT
    end

    def parse_opts
      Docopt::docopt(docopt(filename, srcdir, dstdir),
            version: "Installer: #{Installer::Version::VERSION}")
    rescue Docopt::Exit => e
      puts e.message
      exit 0
    end

    def normalize_opts(opts)
      opts["--dst-dir"] = dstdir if opts["--dst-dir"].nil?
      opts["--src-dir"] = srcdir if opts["--src-dir"].nil?

      newopts = {}

      opts.each do |key, value|
        newkey = key.gsub(/^--/, '')
        newkey = newkey.gsub("\-", "_")
        newkey = newkey.gsub("<", "")
        newkey = newkey.gsub(">", "")
        newkey = newkey.gsub("INSTALL_TYPE", "install_type")
        newopts[newkey] = value
      end
      newopts
    end

    def handle_verbose_and_quiet(opts)
      if opts["verbose"]
        logger.level = Logger::DEBUG
      elsif opts["quiet"]
        logger.level = Logger::WARN
      else
        logger.level = Logger::INFO
      end
    end

    def execute
      opts = parse_opts
      opts = normalize_opts(opts)
      handle_verbose_and_quiet(opts)
      Installer::Install.new(opts).create_links
    end
  end
end
