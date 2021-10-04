#!/usr/bin/bash
# this is an environment lile that has some importatnt things that are used in
# tmux status script
export HAS_BATTERY=$(upower -d 2>/dev/null |grep BAT -c)
# source QUOTY
[[ -e ~/.config/quoty/ ]] && source ~/.config/quoty/quoty.sh  || echo "No quotes today sir"

export GOPATH=$(go env GOPATH) 
export PATH=$PATH:$(go env GOPATH)/bin
