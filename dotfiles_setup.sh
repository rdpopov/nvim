#!/bin/bash
d="$(pwd)/${0}"
root_dir=${d%/*}
ln -s $root_dir to $HOME/.config/${root_dir##*/}
