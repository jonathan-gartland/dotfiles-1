# encoding: utf-8

require 'set'
require 'fileutils'

require 'installer/log'

module Installer
  class Link
    attr_accessor :src, :dst

    def initialize(src, dst)
      @src = src
      @dst = dst
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

      FileUtils.mkdir_p(dst_directory)

      if verbose
        Log.debug("src_dir #{src_directory} src #{src}\n")
        Log.debug("dst_dir #{dst_directory} dst #{dst}\n")
      end

      source = File.join(src_directory, src)
      destination = File.join(dst_directory, dst)


      if verbose
        Log.debug("src: #{source}, destination: #{destination}")
        Log.debug("ln -sf #{source} #{destination}")
        Log.debug("Removing Existing Link: #{destination}")
      end

      if verbose
        Log.debug("about to create link #{source} to #{destination}")
      end

      if !dry_run
        FileUtil.rm(destination)
      end


      if File.exists?(destination)
        Log.warn("file/dir at destination #{destination} already exists.")

        if force
          Log.debug("rm_f on #{destination}")
          # FileUtils.rm_f(destination)
        end
      end
 
      if verbose
        Log.info("Creating Link: #{destination}")
      end

      if !dry_run
        if File.exists?(destination)
          Log.warn("ln_sf source #{source} to destination #{destination}")
          # FileUtils.ln_sf(source, destination)
        end
      end
    end
  end

  class LinkSet < Set
    def pre_linkset_event
    end

    def post_linkset_event
    end
  end

  class Install
    attr_reader :dry_run, :verbose, :dst_dir, :src_dir, :log_level,
    :install_type, :force

    def initialize(options)
      options.each do |k, v|
        Log.debug("#{k} --> #{v}")
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def inplace_edit(file, bak, &block)
      old_stdout = $stdout
      argf = ARGF.clone

      argf.argv.replace [file]
      argf.inplace_mode = bak
      argf.lines do |line|
        yield line
      end
      $stdout = old_stdout
    end

    def _execute_command(cmd)
      # [todo] - Implement method
      Log.warn("Command to execute: #{cmd}")
    end

    def create_links
      links().each_pair do |k, v|
        v.each do |link|
          # Log.info("link #{link} class #{link.class}")
          link.create_link(force: force, verbose: verbose,
                           dst_dir: dst_dir, src_dir: src_dir)
        end
      end
    end

    def links
      gitconfig = nil
      offlineimap = nil
      signature = nil
      msmtprc = nil

      if install_type == nil
        gitconfig = 'dotfiles/gitconfig.NONE'
      end

      if install_type == :work
        gitconfig = 'dotfiles/gitconfig.work'
        offlineimap = 'dotfiles/offlineimaprc.work'
        msmtprc = 'msmtprc/msmtprc.work'
      end

      if install_type == :home
        gitconfig = 'dotfiles/gitconfig.home'
        offlineimap = 'dotfiles/offlineimaprc.home'
        msmtprc = 'msmtp/msmtprc.home'
      end

      # [todo] - move creation of '.ssh' to pre-creation hook
      ssh_dir = File.join(dst_dir, '.ssh')
      FileUtils.mkdir_p(ssh_dir)

        dotfiles = LinkSet.new([
        Link.new('dotfiles', '.dotfiles'),
        Link.new('dotfiles/astylerc', '.astylerc'),
        Link.new('dotfiles/git-prompt.conf', '.git-prompt.conf'),
        Link.new('dotfiles/perltidy', '.perltidy'),
        Link.new('dotfiles/screenrc', '.screenrc'),
        Link.new('dotfiles/sqliterc', '.sqliterc'),
        Link.new('dotfiles/abcde.conf', '.abcde.conf'),
        Link.new( gitconfig, '.gitconfig'),
        Link.new('dotfiles/signature.home', '.signature.home'),
        Link.new('dotfiles/signature.work', '.signature.work'),
        Link.new('dotfiles/signature.work.HTML', '.signature.work.html'),
        Link.new('dotfiles/authinfo.home.gpg', '.authinfo.home'),
        Link.new('dotfiles/authinfo.work.gpg', '.authinfo.work'),
        Link.new('dotfiles/ssh_config', '.ssh/config'),
        Link.new('dotfiles/login.sql', 'login.sql'),
        Link.new('dotfiles/git.scmbrc', '.git.scmbrc'),
        Link.new('dotfiles/perlcriticrc', '.perlcriticrc'),
        Link.new('dotfiles/scmbrc', '.scmbrc'),
        Link.new('dotfiles/offlineimap.py', '.offlineimap.py'),
        Link.new('dotfiles/Xresources', '.Xresources'),
        Link.new(offlineimap, '.offlineimaprc'),
        Link.new('dotfiles/xbindkeysrc', '.xbindkeysrc')
      ])

      # [todo] - move handling of '.logrorate.conf' to post-creation hook
      if !:dry_run
        input = File.join(:src_dir, 'dotfiles/logrotate.conf')
        output_filename = File.join(:dst_dir, '.logrotate.conf')

        inplace_edit output_filename, '.bak' do |line|
          line = line.gsub(/\$home/, ENV['home'])
          print line
        end
      end

      fonts = LinkSet.new([Link.new('fonts', '.fonts')])

      terminator = LinkSet.new([Link.new('terminator', '.config/terminator')])

      lilyterm = LinkSet.new([Link.new('lilyterm', '.config/lilyterm')])

      rxvt = LinkSet.new([Link.new('rxvt', '.rxvt')])

      abook = LinkSet.new([Link.new('abook', '.abook')])

      mutt = LinkSet.new([
        Link.new('mutt', '.mutt'),
        Link.new('mutt/muttrc', '.muttrc')
      ])

      msmtp = LinkSet.new([
        Link.new(msmtprc, '.msmtprc'),
        Link.new('msmtp/msmtp.authinfo.home.gpg', '.msmtp.authinfo.home.gpg')
      ])

      bash = LinkSet.new([
        Link.new('bash', '.bash'),
        Link.new('bash/bashrc', '.bashrc'),
        Link.new('bash/inputrc', '.inputrc'),
        Link.new('bash/bash_profile', '.bash_profile'),
        Link.new('bash/bash_logout', '.bash_logout'),
        Link.new('scm_breeze', '.scm_breeze')
      ])

      emacs = LinkSet.new([Link.new('emacs', '.emacs.d')])

      # TODO: Add pre-link creation hook to clone repo
      ffind = LinkSet.new([Link.new('friendly-find/ffind', 'bin/ffind')])

      i3 = LinkSet.new([Link.new('i3', '.i3')])

      clojure = LinkSet.new([Link.new('lein', '.lein'),
                             Link.new('cljr', '.cljr'),
                             Link.new('m2', '.m2')])

      vim = LinkSet.new([
        Link.new('vim/after', 'vim/after'),
        Link.new('vim/vimrc.basic.vim', '.vimrc'),
        Link.new('vim/vimrc.local', '.vimrc.local'),
        Link.new('vim/vimrc.before.local', '.vimrc.before.local'),
        Link.new('vim/vimrc.bundles.local', '.vimrc.bundles.local')])

      # TODO: Add pre-link creation hook to clone repo
      vimpager = LinkSet.new([
        Link.new('vimpager/vimpager', 'bin/vimpager'),
        Link.new('vimpager/vimcat', 'bin/vimcat')])

      gnupg = LinkSet.new([Link.new('gnupg', '.gnupg')])

      bazaar = LinkSet.new([Link.new('bazaar', '.bazaar')])

      # [todo] - Added creation of .config to pre-link event hook
      sublime_text = LinkSet.new([
      Link.new('sublime-text-3', '.config/sublime-text-3')])

      zsh = LinkSet.new([Link.new('zsh', '.zsh'),
                         Link.new(
                          'zsh/clauswitt.zsh-theme',
                          '.oh-my-zsh/themes/clauswitt.zsh-theme'),
                         Link.new('oh-my-zsh', '.oh-my-zsh'),
                         Link.new('zsh/zshrc', '.zshrc'),
                         Link.new('zsh/zlogin', '.zlogin')])

      procmail = nil
      if install_type == :work
        procmail = LinkSet.new([
        Link.new('procmail/work', '.procmail'),
        Link.new('procmail/work/procmailrc', '.procmailrc')])
      end

      if install_type == :home
        procmail = LinkSet.new([
        Link.new('procmail/home', '.procmail'),
        Link.new('procmail/home/procmailrc', '.procmailrc')])
      end

      bin = LinkSet.new([Link.new('bin', 'bin')])

      {
      bash: bash,
      bazaar: bazaar,
      bin: bin,
      clojure: clojure,
      dotfiles: dotfiles,
      emacs: emacs,
      ffind: ffind,
      fonts: fonts,
      gnupg: gnupg,
      i3: i3,
      mutt: mutt,
      msmtp: msmtp,
      abook: abook,
      lilyterm: lilyterm,
      procmail: procmail,
      rxvt: rxvt,
      sublime_text: sublime_text,
      terminator: terminator,
      vimpager: vimpager,
      vim: vim,
      zsh: zsh
      }
    end
  end
end
