# encoding: utf-8

require 'installer/log'

module Installer
  # This class holds the source and destination of a link and can create a link
  # between the two.
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
      _create_destintation_dir(options)

      source = File.join(options[:src_directory], src)
      destination = File.join(options[:dst_directory], dst)

      if options[:verbose]
        Log.debug("source: #{source}, destination: #{destination}")
        Log.debug("src: #{src}, dst: #{dst}")
        Log.debug("ln -sf #{source} #{destination}")
        Log.debug("about to create link #{source} to #{destination}")
      end

      _remove_existing_link(destination, options)
      _create_link(destination, options)
    end

    private

      def _create_destintation_dir(options)
        FileUtils.mkdir_p(options[:dst_directory]) unless File.exists?(options[:dst_directory])

        if options[:verbose]
          Log.debug("src_dir #{options[:src_directory]} src #{src}\n")
          Log.debug("dst_dir #{options[:dst_directory]} dst #{dst}\n")
        end
      end

      def _create_link(destination, options)
        Log.info("Creating Link: #{destination}")

        unless dry_run
          Log.debug("ln_sf source #{source} to destination #{destination}")
          FileUtils.ln_sf(source, destination)
        end
      end

      def _remove_existing_link(destination, options)
        if File.exist?(destination) || options[:force]
          Log.debug("Removing existing link #{destination}") if options[:verbose]

          unless options[:dry_run]
            if File.directory?(destination)
              FileUtils.rm_r(destination)
            else
              FileUtils.rm(destination)
            end
          end
        end
      end
  end
end
