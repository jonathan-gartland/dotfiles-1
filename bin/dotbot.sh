#!/bin/sh

cd ~/src/dotbot

virtualenv .
. ./bin/activate

pip install --upgrade pip
pip install PyYaml

base_dir=~/dot-files-forest
config_file=~/dot-files-forest/install.conf.yaml

~/src/dotbot/bin/dotbot --base-directory $base_dir --config-file $config_file -q

deactivate
