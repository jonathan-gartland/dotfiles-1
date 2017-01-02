
# Introduction
    Instructions for setting-up dotfiles

# Setup

0. Install
    1. python

1) Download this repo
   1) mkdir ~/src; cd ~/src
   2) git clone git@github.com:skk/dotfiles.git

2) install submodules
    ```
    cd ~/src/dotfiles
    git submodule init
    git submodule update
    ```
3) Create Links
    ```
    cd ~/src/dotfiles
    python install.py -l home|work|none
    ```

# License

MIT License; see [LICENSE.txt](LICENSE.txt) for more details.
