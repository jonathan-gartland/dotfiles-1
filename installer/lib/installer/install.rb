# encoding: utf-8

require 'fileutils'

require 'installer/log'
require 'installer/link'
require 'installer/link_set'

module Installer
  # [todo] - Add top-level class documentation comment.
  class Install
    include Installer::Logging
    attr_reader :dry_run, :verbose, :dst_dir, :src_dir,
                :log_level, :install_type, :force

    def initialize(options)
      options.each do |k, v|
       logger.debug("log #{k} --> #{v}")
       instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    # [todo] - Move to Util class/module ?
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

    # [todo] - split and move linkset.link.each block to LinkSet class
    def create_links
      links.each_pair do |key, linkset|
        logger.debug("key #{key}, linkset #{linkset}")
        linkset.links.each do |link|
          logger.debug("#{link}")
          link.create_link(force: force, verbose: verbose, dry_run: dry_run,
                           dst_dir: dst_dir, src_dir: src_dir)
        end
      end
    end

    def dotfiles
      gitconfig = 'dotfiles/gitconfig.NONE'
      offlineimap = nil

      if install_type == "work"
        gitconfig = 'dotfiles/gitconfig.WORK'
        offlineimap = 'dotfiles/offlineimaprc.WORK'
      end

      if install_type == "home"
        gitconfig = 'dotfiles/gitconfig.HOME'
        offlineimap = 'dotfiles/offlineimaprc.HOME'
      end

      # [todo] - move creation of '.ssh' to pre-creation hook
      ssh_dir = File.join(dst_dir, '.ssh')
      FileUtils.mkdir_p(ssh_dir)

      dotfiles = LinkSet.new(
        Link.new('dotfiles', '.dotfiles'),
        Link.new('dotfiles/astylerc', '.astylerc'),
        Link.new('dotfiles/git-prompt.conf', '.git-prompt.conf'),
        Link.new('dotfiles/perltidy', '.perltidy'),
        Link.new('dotfiles/screenrc', '.screenrc'),
        Link.new('dotfiles/sqliterc', '.sqliterc'),
        Link.new('dotfiles/abcde.conf', '.abcde.conf'),
        Link.new(gitconfig, '.gitconfig'),
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
        Link.new('dotfiles/tmux.conf', '.tmux.conf'),
        Link.new('dotfiles/fonts.conf', '.fonts.conf'),
        Link.new(offlineimap, '.offlineimaprc'),
        Link.new('dotfiles/xbindkeysrc', '.xbindkeysrc'))

      # [todo] - move handling of '.logrorate.conf' to post-creation hook
      unless :dry_run
        input = File.join(:src_dir, 'dotfiles/logrotate.conf')
        output_filename = File.join(:dst_dir, '.logrotate.conf')

        inplace_edit output_filename, '.bak' do |line|
          line = line.gsub(/\$home/, ENV['home'])
          print line
        end

        inplace_edit input, '.bak' do |line|
          line = line.gsub(/\$home/, ENV['home'])
          print line
        end
      end

      dotfiles
    end

    def fonts
      LinkSet.new(Link.new('fonts', '.fonts'))
    end

    def terminator
      LinkSet.new(Link.new('terminator', '.config/terminator'))
    end

    def lilyterm
      LinkSet.new(Link.new('lilyterm', '.config/lilyterm'))
    end

    def rxvt
      LinkSet.new(Link.new('rxvt', '.rxvt'))
    end

    def abook
      LinkSet.new(Link.new('abook', '.abook'))
    end

    def mutt
      LinkSet.new(Link.new('mutt', '.mutt'),
                  Link.new('mutt/muttrc', '.muttrc'))
    end

    def msmtp
      if install_type == "work"
        LinkSet.new(Link.new('msmtprc/msmtprc.WORK', '.msmtprc'),
                    Link.new('msmtp/msmtp.authinfo.HOME.gpg',
                            '.msmtp.authinfo.HOME.gpg'))
      elsif install_type == "home"
        LinkSet.new(Link.new('msmtprc/msmtprc.HOME', '.msmtprc'),
                    Link.new('msmtp/msmtp.authinfo.HOME.gpg',
                            '.msmtp.authinfo.HOME.gpg'))
      end
    end

    def bash
      LinkSet.new(
        Link.new('bash', '.bash'),
        Link.new('bash/bashrc', '.bashrc'),
        Link.new('bash/inputrc', '.inputrc'),
        Link.new('bash/bash_profile', '.bash_profile'),
        Link.new('bash/bash_logout', '.bash_logout'),
        Link.new('scm_breeze', '.scm_breeze'))
    end

    def emacs
      LinkSet.new(Link.new('emacs', '.emacs.d'))
    end

    # [todo] - Add pre-link creation hook to clone repo
    def ffind
      LinkSet.new(Link.new('friendly-find/ffind', 'bin/ffind'))
    end

    def i3
      LinkSet.new(Link.new('i3', '.i3'))
    end

    def clojure
      LinkSet.new(Link.new('lein', '.lein'),
                  Link.new('cljr', '.cljr'),
                  Link.new('m2', '.m2'))
    end

    def vim
      LinkSet.new(Link.new('vim/vimrc.basic.vim', '.vimrc'))
    end

    # [todo] - Add pre-link creation hook to clone repo
    def vimpager
      LinkSet.new(
        Link.new('vimpager/vimpager', 'bin/vimpager'),
        Link.new('vimpager/vimcat', 'bin/vimcat'))
    end

    def gnupg
      LinkSet.new(Link.new('gnupg', '.gnupg'))
    end

    def bazaar
      LinkSet.new(Link.new('bazaar', '.bazaar'))
    end

    # [todo] - Added creation of .config to pre-link event hook
    def sublime_text
      LinkSet.new(Link.new('sublime-text-3', '.config/sublime-text-3'))
    end

    def fish
    # [todo] - .oh-my-fish needs to be created
        LinkSet.new(Link.new('oh-my-fish', '.oh-my-fish'))
    end

    def zsh
    # [todo] - .oh-my-zsh needs to be created
    # before the next link but its not being created
      LinkSet.new(Link.new('zsh', '.zsh'),
                  Link.new('oh-my-zsh', '.oh-my-zsh'),
                  Link.new('zsh/clauswitt.zsh-theme',
                           '.oh-my-zsh/themes/clauswitt.zsh-theme'),
                  Link.new('zsh/zshrc', '.zshrc'),
                  Link.new('zsh/zlogin', '.zlogin'))
    end

    def procmail
      if install_type == "work"
        return LinkSet.new(
                Link.new('procmail/work', '.procmail'),
                Link.new('procmail/work/procmailrc', '.procmailrc'))
      end

      if install_type == "home"
        LinkSet.new(
          Link.new('procmail/home', '.procmail'),
          Link.new('procmail/home/procmailrc', '.procmailrc'))
      end
    end

    def bin
      LinkSet.new(Link.new('bin', 'bin'))
    end

    def awesome
      LinkSet.new(Link.new('awesome', '.config/awesome'),
                  Link.new('lain', '.config/awesome/lain'),
                  # [todo] - treesome needs to be checkout before creating link
                  Link.new('treesome', '.config/awesome/treesome'))
    end

    def terminol
      LinkSet.new(Link.new('terminol', '.config/terminol'))
    end

    def links
      {
        awesome: awesome, bash: bash, bazaar: bazaar, bin: bin, zsh: zsh,
        dotfiles: dotfiles, emacs: emacs, ffind: ffind, fonts: fonts,
        gnupg: gnupg, mutt: mutt, msmtp: msmtp, abook: abook, vim: vim,
        procmail: procmail, rxvt: rxvt, sublime_text: sublime_text, i3: i3,
        terminator: terminator, vimpager: vimpager, lilyterm: lilyterm,
        clojure: clojure
      }
    end
  end
end
