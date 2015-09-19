#!/bin/sh

# move current directory
pushd `dirname $0`

# set install directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
ansible-playbook -i hosts -vv initialized.yml


popd
