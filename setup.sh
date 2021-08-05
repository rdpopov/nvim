#!/bin/bash
# presumed for ubuntu-based systems

apt_install(){
    sudo apt-get install  $@ -y
}

setup_deps(){
    apt_install fuse libfuse2 git python3-pip ack-grep 
    apt_install nodejs npm yarn
    apt_install ripgrep
}

setup_nvim(){
    wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
    chmod +x nvim && sudo chown root:root nvim && sudo mv nvim /usr/bin
    pip3 install --user neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    [ -d "$HOME/.undodir" ]  || mkdir $HOME"/.undodir"
}

setup_tmux(){
    [ -e "$HOME/.tmux.conf" ] && mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
    cp dots/tmux.conf $HOME/.tmux.conf
    [ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm #tmux package manager
}

setup_alac(){
    [ -e "$HOME/alacritty.yml" ] && mv $HOME/.alacritty.yml $HOME/.alacritty.yml.bak
    cp dots/alacritty.yml $HOME/.alacritty.yml
}

for arg in "$@";do
  case "$arg" in
    "--tmux" | "-t" )
      setup_tmux
    ;;
    "--alac" | "-a" )
      setup_alac
    ;;
    "--nvim" | "-n" )
      setup_nvim
    ;;
    "--deps" | "-d" )
      setup_deps
    ;;
    "--all" | "-A" )
      setup_deps
      setup_nvim
      setup_tmux
      setup_alac
    ;;
  esac
done
