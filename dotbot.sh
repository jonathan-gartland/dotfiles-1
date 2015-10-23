#!/bin/sh

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

if [[ "$OSTYPE" == darwin* ]]; then
    ~/src/dotbot/bin/dotbot --base-directory $base_dir --config-file $osx_config_file -q
fi

if [[ "$OSTYPE" == linux* ]]; then
    ~/src/dotbot/bin/dotbot --base-directory $base_dir --config-file $linux_config_file -q
fi

deactivate
