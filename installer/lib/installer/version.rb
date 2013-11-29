# encoding: utf-8

module Installer
  class Version
    MAJOR = 0
    MINOR = 1
    PATCH = 0
    BUILD = nil
    VERSION = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
  end
end
