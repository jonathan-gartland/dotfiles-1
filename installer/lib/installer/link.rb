# encoding: utf-8

require 'installer/log'

module Installer
  # This class holds the source and destination of a link and can create a link
  # between the two.
  class Link
    include Installer::Logging

    attr_accessor :src, :dst

    def initialize(src, dst)
      @src = src
      @dst = dst
    end

    def to_s
      "Link: src: #{src}, dst #{dst}"
    end

    def pre_link_event
      logger.debug("Link src #{:src} dst #{:dst} pre_link_event")
    end

    def post_link_event
      logger.debug("Link src #{:src} dst #{:dst} post_link_event")
    end

    def create_link(options)
      source = File.join(options[:src_dir], src)
      destination = File.join(options[:dst_dir], dst)

      options[:src_directory] = source
      options[:dst_directory] = destination

      _create_destintation_dir(options)

      logger.debug("source: #{source}, destination: #{destination}")
      logger.debug("src: #{src}, dst: #{dst}")
      logger.debug("ln -sf #{source} #{destination}")
      logger.debug("about to create link #{source} to #{destination}")

      _remove_existing_link(destination, options)
      _create_link(destination, options)
    end

    private

      def _create_destintation_dir(options)
        unless options[:dry_run]
          FileUtils.mkdir_p(options[:dst_directory]) unless File.exists?(options[:dst_directory])
        end

        logger.debug("src_dir #{options[:src_directory]} src #{src}\n")
        logger.debug("dst_dir #{options[:dst_directory]} dst #{dst}\n")
      end

      def _create_link(destination, options)
        logger.info("Creating Link: #{destination}")

        unless options[:dry_run]
          logger.debug("ln_sf source #{options[:src_directory]} to destination #{options[:dst_directory]}")
          FileUtils.ln_sf(options[:src_directory], options[:dst_directory])
        end
      end

      def _remove_existing_link(destination, options)
        if File.exist?(destination) || options[:force]
          logger.debug("Removing existing link #{destination}")

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
