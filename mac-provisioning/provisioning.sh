#!/bin/sh
# set install directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
ansible-playbook -i hosts -vv initialized.yml
