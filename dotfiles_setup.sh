#!/bin/bash
d="$(pwd)/${0}"
root_dir=${d%/*}
ln -s  $root_dir $HOME/.config/${root_dir##*/}
