#!/bin/bash
d="$(pwd)/${0}"
root_dir=${d%/*}
[ -L $HOME/.config/${root_dir##*/} ] || ln -s  $root_dir $HOME/.config/${root_dir##*/}
