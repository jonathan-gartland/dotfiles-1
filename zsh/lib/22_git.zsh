if [ -f ~/src/dotfiles/.git-flow-completetion/git-flow-completion.zsh ]; then
    source ~/src/dotfiles/.git-flow-completetion/git-flow-completion.zsh
fi

export _GIT_AUTHOR_NAME="Steven Knight"
export _GIT_AUTHOR_EMAIL="steven@knight.cx"

function switch_to_personal_git_config() {
    git config --local user.name $_GIT_AUTHOR_NAME
    git config --local user.email $_GIT_AUTHOR_EMAIL
}

function update_git_commits_to_personal_config() {
    git filter-branch --commit-filter 'GIT_AUTHOR_NAME=$_GIT_AUTHOR_NAME; GIT_AUTHOR_EMAIL=$_GIT_AUTHOR_EMAIL; git commit-tree "$@";'
}
