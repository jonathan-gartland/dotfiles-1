
# Introduction
    Instructions for setting-up dotfiles

# Setup

0) Install Python 2.7 or later

1) Download this repo

    mkdir ~/src
    cd ~/src
    git clone git@github.com:skk/dotfiles.git`

2) Download dependencies - This will download all the dependencies for dotfiles

        python install.py --git_clone, -c

3) Create links - Choose one of the following to create the links for either home, work or none (i.e. neither).

        python install.py work
        python install.py home
        python install.py none


3) Update dependencies - This will download all the dependencies for dotfiles

        python install.py --git_update, -u

# License

MIT License; see [LICENSE.txt](LICENSE.txt) for more details.
