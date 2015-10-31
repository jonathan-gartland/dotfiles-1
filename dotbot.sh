#!/bin/bash

source ~/dot-files-forest/zsh/lib/00_base.zsh

cd ~/src/dotbot

virtualenv .
. ./bin/activate

pip install --upgrade pip
pip install PyYaml

base_dir=~/dot-files-forest
config_file=~/dot-files-forest/install.conf.yaml
osx_config_file=~/dot-files-forest/osx_install.conf.yaml
linux_config_file=~/dot-files-forest/linux_install.conf.yaml

~/src/dotbot/bin/dotbot --base-directory $base_dir --config-file $config_file

if [[ "$OS_IS_MAC_OS_X" = true ]]; then
    ~/src/dotbot/bin/dotbot --base-directory $base_dir --config-file $osx_config_file -q
fi

if [[ "$OS_IS_LINUX" = true ]]; then
    ~/src/dotbot/bin/dotbot --base-directory $base_dir --config-file $linux_config_file -q
fi

deactivate
