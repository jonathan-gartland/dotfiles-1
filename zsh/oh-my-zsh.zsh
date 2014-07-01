# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(autojump archlinux
         bundler
         colored-man colorize common-aliases command-not-found copydir copyfile cp
         dirhistory
         gpg-agent gem git git-prompt git-extras git-flow git-hubflow git-remote-branch github gnu-utils
         history history-substring-search
         python
         rails rsync ruby rvm
         ssh-agent sudo sublime systemd
         themes tmux
         web-search
         z)

source $ZSH/oh-my-zsh.sh

# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/dot-files-forest/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

source $HOME/dot-files-forest/zsh/skk.zsh-theme

node_prompt_info() {
   echo ""
}

