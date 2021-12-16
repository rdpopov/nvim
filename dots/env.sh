#!/usr/bin/bash
# this is an environment lile that has some importatnt things that are used in
# tmux status script

fay() {
	packages=$(awk {'print $1'} <<< $(yay -Ss $1 | awk 'NR%2 {printf "\033[1;32m%s \033[0;36m%s\033[0m — ",$1,$2;next;}{ print substr($0, 5, length($0) - 4); }' | fzf -m --ansi))
	[ "$packages" ] && yay -S $(echo "$packages" | tr "\n" " ")
}

facman() {
	packages="$(awk {'print $1'} <<< $(pacman -Ss $1 | awk 'NR%2 {printf "\033[1;32m%s \033[0;36m%s\033[0m — ",$1,$2;next;}{ print substr($0, 5, length($0) - 4); }' | fzf -m --ansi --select-1))"
	[ "$packages" ] && pacman -S $(echo "$packages" | tr "\n" " ")
}

fapt() {
  apt-cache search '' | sort | cut --delimiter ' ' --fields 1 | fzf --multi --cycle --reverse --preview 'apt-cache show {1}' | xargs -r sudo apt install -y
}

fzf_install(){
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
}


export HAS_BATTERY=$(upower -d 2>/dev/null |grep BAT -c)
# source QUOTY
[[ -e ~/.config/quoty/ ]] && source ~/.config/quoty/quoty.sh  || echo "No quotes today sir"

export TMUX_VER=$(tmux -V|cut -f2 -d" ") # need this to automatically pick clors for editor
export GOPATH=$(go env GOPATH) 
export PATH=$PATH:$(go env GOPATH)/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -z $(command -v fzf) ]] && fzf_install # auto install fzf if fzf does not exist

[[ -x "$(command -v apt)" ]] && alias pac="fapt"
[[ -x "$(command -v pacman)" ]] && alias pac="facman"
[[ -x "$(command -v yay)" ]] && alias pac="fay"

set keymap vi-command "diw": "bde"
set keymap vi-command "ciw": "bdei"
set keymap vi-command "dw": "de"
set keymap vi-command "cw": "dei"
set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[34;1m\2(INSERT)\1\e[0m\2'
bind 'set vi-cmd-mode-string \1\e[33;1m\2(COMAND)\1\e[0m\2'
PS1='[\[\033[01;32m\]\u \[\033[01;34m\]\W\[\033[00m\]]\$ '