# encoding: utf-8

require 'installer/log'

module Installer
  # [todo] - Add top-level class documentation comment.
  class Link
    attr_accessor :src, :dst

    def initialize(src, dst)
      @src = src
      @dst = dst
    end

    def to_s
      "Link: src: #{src}, dst #{dst}"
    end

    def pre_link_event
      Log.debug("Link src #{:src} dst #{:dst} pre_link_event")
    end

    def post_link_event
      Log.debug("Link src #{:src} dst #{:dst} post_link_event")
    end

    def create_link(options)
      verbose = options[:verbose]
      force = options[:force]
      dry_run = options[:dry_run]
      dst_directory = options[:dst_dir]
      src_directory = options[:src_dir]

      FileUtils.mkdir_p(dst_directory) unless File.exists?(dst_directory)

      if verbose
        Log.debug("src_dir #{src_directory} src #{src}\n")
        Log.debug("dst_dir #{dst_directory} dst #{dst}\n")
      end

      source = File.join(src_directory, src)
      destination = File.join(dst_directory, dst)

      if verbose
        Log.debug("source: #{source}, destination: #{destination}")
        Log.debug("src: #{src}, dst: #{dst}")
        Log.debug("ln -sf #{source} #{destination}")
        Log.debug("about to create link #{source} to #{destination}")
      end

      if File.exist?(destination) || force
        Log.debug("Removing existing link #{destination}") if verbose

        unless dry_run
          if File.directory?(destination)
            Log.debug("rm_r (dir) destination #{destination}")
            FileUtils.rm_r(destination)
          else
            Log.debug("rm (file) destination #{destination}")
            FileUtils.rm(destination)
          end
        end
      end

      Log.info("Creating Link: #{destination}")

      unless dry_run
        Log.debug("ln_sf source #{source} to destination #{destination}")
        FileUtils.ln_sf(source, destination)
      end
    end
  end
end
