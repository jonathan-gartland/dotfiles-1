# encoding: utf-8

require "logger"

module Installer
  # http://stackoverflow.com/questions/917566/ruby-share-logger-instance-among-module-classes#answer-6768164
  module Logging
    # This is the magical bit that gets mixed into your classes
    def logger
      Logging.logger
    end

    # Global, memorized, lazy initialized instance of a logger
    def self.logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = 'installer'
        log.formatter = proc do |serverity, time, progname, msg|
          "#{serverity}: #{time} - #{msg}\n"
        end
      end
    end
  end
end
