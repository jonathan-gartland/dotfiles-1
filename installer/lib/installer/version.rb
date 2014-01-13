# encoding: utf-8

module Installer
  # This class provides VERSION information.
  class Version
    private

      MAJOR = 0
      MINOR = 2
      PATCH = 0
      BUILD = nil

    public

      VERSION = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')
  end
end
