# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
#
#set -x Z_SCRIPT_PATH $HOME/src/z/z.sh

source ~/dot-files-forest/z-fish/z.fish
set fish_plugins autojump bundler rvm sublime archlinux git

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
