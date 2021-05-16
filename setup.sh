#!/bin/bash
# presumed for ubuntu-based systems

apt_install(){
    sudo apt-get install  $@ -y
}

setup_nvim(){

    apt_install fuse libfuse2 git python3-pip ack-grep 
    apt_install nodejs npm yarn
    apt_install ripgrep
    wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
    chmod +x nvim && sudo chown root:root nvim && sudo mv nvim /usr/bin
    pip3 install --user neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    if [[ $HOME/.tmux.conf -e ]]; then
      mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
    fi
    cp tmux.conf $HOME/.tmux.conf

}
