# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
#ZSH_THEME="superjarin"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

plugins=(autojump archlinux
         bundler
         colored-man colorize command-aliases command-not-found copydir copyfile cp
         command-not-found
         git git-prompt git-extras git-flow git-hubflow git-remote-branch github gnu-utils
         history history-substring-search
         python
         rails rsync ruby rvm
         ssh-agent sublime
         themes thor tmux
         z)

source $ZSH/oh-my-zsh.sh
source $HOME/dot-files-forest/zsh/skk.zsh-theme

node_prompt_info() {
   echo ""
}
