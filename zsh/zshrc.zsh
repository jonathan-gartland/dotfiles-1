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

    horosgrisa/autoenv
EOBUNDLES

antigen apply

# strict control over source order
sources=(
    'linux'
    'osx'

    'hub'
    'path'
    'bullet-train.zsh-theme'
    'completions'
    'functions'
    'alias'
    # 'prompt'
    # 'zle'
    # 'highlight'
)

for src in $sources; do
    filename=~/.zsh/lib/$src.zsh
    source $filename
done

if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# restore cdpath
cdpath+=($cdpath_backup)

# time2=$(gdate +%s.%N)
# let "delta_time=$time2 - $time1"
# echo "Elapsed Time $delta_time"

