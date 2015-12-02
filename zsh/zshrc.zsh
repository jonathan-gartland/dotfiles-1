# time1=$(gdate +%s.%N)

[[ $TERM == "dumb" ]] && unstetopt zle && PS1='$ ' && return

# load antigen
source ~/src/antigen/antigen.zsh

# save cdpath as loading oh-my-zsh will reset it
cdpath_backup=($cdpath)

source "$HOME/.zsh/lib/00_base.zsh"
source_if_exists "/etc/bash_completion.d/virtualenvwrapper"

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
vagrant

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
    # moved to zshenv
    # '10_python'
    # '11_ruby'
    
    '20_mysql'
    '30_linux'
    '31_osx'
    '40_prompt'
    '50_hub'
    '51_vcsinfo'
    # '60_zle'
    # '61_highlight'
    '62_misc'
    '63_smartcd'
)


for src in $sources; do
    source_if_exists "$HOME/.zsh/lib/$src.zsh"
done

source_if_exists "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

antigen apply

# restore cdpath
cdpath+=($cdpath_backup)

