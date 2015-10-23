# time1=$(gdate +%s.%N)

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# load antigen
source ~/dot-files-forest/antigen/antigen.zsh

# save cdpath as loading oh-my-zsh will reset it
cdpath_backup=($cdpath)

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    autojump
    colored-man
    colorize
    common-aliases
    git
    git-flow
    mercurial
    gem
    rails
    ruby
    mix
    ssh-agent
    sudo
    systemd
    vundle
    virtualenvwrapper
    z
    zsh-users/zsh-syntax-highlighting

EOBUNDLES

antigen apply

# strict control over source order
sources=(
    '01_alias'
'02_completions'
'03_functions'
'04_path'
'10_python'
# '11_rbenv'
# '12_ruby'
# '13_chruby'
'20_mysql'
'30_linux'
'31_osx'
# '32_bullet-train.zsh-theme'
# '40_prompt'
'41_prompt.skk'
'50_hub'
'51_vcsinfo'
# '60_zle'
# '61_highlight'
'62_misc'
'63_smartcd'

    # 'linux'
    # 'osx'

    # 'hub'
    # 'path'
    # # prompt needs to be after path, as prompts uses external commands
    # 'prompt'

    # 'completions'
    # 'functions'
    # 'alias'
    # 'smartcd'


    # 'bullet-train.zsh-theme'
    # 'zle'
    # 'highlight'
)

for src in $sources; do
    filename=~/.zsh/lib/$src.zsh
    source $filename
done

read_if_exists "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# restore cdpath
cdpath+=($cdpath_backup)

# time2=$(gdate +%s.%N)
# let "delta_time=$time2 - $time1"
# echo "Elapsed Time $delta_time"

[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config
