# encoding: utf-8

require 'fileutils'

require 'installer/log'
require 'installer/link'
require 'installer/link_set'

module Installer
  # [todo] - Add top-level class documentation comment.
  class Install
    attr_reader :dry_run, :verbose, :dst_dir, :src_dir, :log_level,
                :install_type, :force

    def initialize(options)
      options.each do |k, v|
        Log.debug("#{k} --> #{v}")
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
        Log.debug("key #{key}, linkset #{linkset}")
        linkset.links.each do |link|
          Log.debug("#{link}")
          link.create_link(force: force, verbose: verbose,
                           dst_dir: dst_dir, src_dir: src_dir)
        end
      end
    end

    # [todo] - split links method into bash, ssh, dotfiles, fonts, terminator, etc ... methods
    def links
      gitconfig = 'dotfiles/gitconfig.NONE'
      offlineimap = nil
      msmtprc = nil

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

      fonts = LinkSet.new(Link.new('fonts', '.fonts'))

      terminator = LinkSet.new(Link.new('terminator', '.config/terminator'))

      lilyterm = LinkSet.new(Link.new('lilyterm', '.config/lilyterm'))

      rxvt = LinkSet.new(Link.new('rxvt', '.rxvt'))

      abook = LinkSet.new(Link.new('abook', '.abook'))

      mutt = LinkSet.new(
        Link.new('mutt', '.mutt'),
        Link.new('mutt/muttrc', '.muttrc'))

      msmtp = LinkSet.new(
        Link.new(msmtprc, '.msmtprc'),
        Link.new('msmtp/msmtp.authinfo.home.gpg', '.msmtp.authinfo.home.gpg'))

      bash = LinkSet.new(
        Link.new('bash', '.bash'),
        Link.new('bash/bashrc', '.bashrc'),
        Link.new('bash/inputrc', '.inputrc'),
        Link.new('bash/bash_profile', '.bash_profile'),
        Link.new('bash/bash_logout', '.bash_logout'),
        Link.new('scm_breeze', '.scm_breeze'))

      emacs = LinkSet.new(Link.new('emacs', '.emacs.d'))

      # TODO: Add pre-link creation hook to clone repo
      ffind = LinkSet.new(Link.new('friendly-find/ffind', 'bin/ffind'))

      i3 = LinkSet.new(Link.new('i3', '.i3'))

      clojure = LinkSet.new(Link.new('lein', '.lein'),
                            Link.new('cljr', '.cljr'),
                            Link.new('m2', '.m2'))

      vim = LinkSet.new(Link.new('vim/vimrc.basic.vim', '.vimrc'))

      # TODO: Add pre-link creation hook to clone repo
      vimpager = LinkSet.new(
        Link.new('vimpager/vimpager', 'bin/vimpager'),
        Link.new('vimpager/vimcat', 'bin/vimcat'))

      gnupg = LinkSet.new(Link.new('gnupg', '.gnupg'))

      bazaar = LinkSet.new(Link.new('bazaar', '.bazaar'))

      # [todo] - Added creation of .config to pre-link event hook
      sublime_text = LinkSet.new(
      Link.new('sublime-text-3', '.config/sublime-text-3'))

      zsh = LinkSet.new(Link.new('zsh', '.zsh'),
                        Link.new(
                          'zsh/clauswitt.zsh-theme',
                          '.oh-my-zsh/themes/clauswitt.zsh-theme'),
                        Link.new('oh-my-zsh', '.oh-my-zsh'),
                        Link.new('zsh/zshrc', '.zshrc'),
                        Link.new('zsh/zlogin', '.zlogin'))

      procmail = nil
      if install_type == :work
        procmail = LinkSet.new(
        Link.new('procmail/work', '.procmail'),
        Link.new('procmail/work/procmailrc', '.procmailrc'))
      end

      if install_type == :home
        procmail = LinkSet.new(
        Link.new('procmail/home', '.procmail'),
        Link.new('procmail/home/procmailrc', '.procmailrc'))
      end

      bin = LinkSet.new(Link.new('bin', 'bin'))

      puts "bash links #{bash.links}"

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
