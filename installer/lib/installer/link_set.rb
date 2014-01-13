# encoding: utf-8

require 'set'

module Installer
  # This class holds a set of links.
  class LinkSet
    include Enumerable

    attr_accessor :links

    def initialize(*args)
      @links = Set.new(args)
    end

    def each(&block)
      links.each_key(&block)
      self
    end

    def to_s
      links.map { |l| l.to_s }
    end
  end
end
