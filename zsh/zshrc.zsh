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
    '11_ruby'
    '20_mysql'
    '30_linux'
    '31_osx'
    # '32_bullet-train.zsh-theme'
    '40_prompt'
    # '41_prompt.skk'
    '50_hub'
    '51_vcsinfo'
    # '60_zle'
    # '61_highlight'
    '62_misc'
    '63_smartcd'
)

source "$HOME/.zsh/lib/00_base.zsh"

for src in $sources; do
    source_if_exists "$HOME/.zsh/lib/$src.zsh"
done

source_if_exists "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# restore cdpath
cdpath+=($cdpath_backup)
