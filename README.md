
# Introduction
    Instructions for setting-up dot-files-forest.

# Setup

0) Install
    a) python
    c) virtualenv, mkvirtualenv
    d) libyaml
    d) create virtualenv and install pyyaml
    ```
    mkvirtualenv py
    workon py
    pip install pyyaml
    ```
    
1) Download install.py

2) Clone Repos

    ```
    cd $HOME
    ~/dot-files-forest/install.py -c
    ```

3) Create Links

    ```
    cd $HOME
    ~/dot-files-forest/install.py -l home|work|none
    ```
