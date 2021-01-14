#!/bin/bash

bringup(){
    mkdir $1
}

teardown(){
    rm -rf $1
}

add_to_PATH(){
    shell=${SHELL##*/}
    if [["$shell" == "zsh"]];then
        echo "PATH=$1:\$PATH">>.zshrc
    elif [[ "$shell" == "bahs" ]];then
        echo "PATH=$1:\$PATH">>.bashrc
    fi
}

apt_install(){
    sudo apt-get install $@
}

pip_isntall(){
    pip isntall $1 && echo "installed! $1"
}

setup_nvim(){
    cd $TempFolder/nvim
    TempFolder_Nvim= $TempFolder/nvim
    echo "setting up Neovim"
    apt_install fuse libfuse2 git python3-pip ack-grep -y
    wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
    chmod +x nvim && sudo chown root:root nvim && sudo mv nvim /usr/bin && git clone
    if [[ $1 != "" ]];then
        git clone --branch master ~/.config/ https://github.com/Rosen-Popov/nvim.git $TempFolder_Nvim && echo "Neovim set up"
    else
        git clone --branch $1 ~/.config/ https://github.com/Rosen-Popov/nvim.git $TempFolder_Nvim && echo "Neovim set up"
    fi
    pip3 install --user neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

setup_nim_dev() {
    curl https://nim-lang.org/choosenim/init.sh -sSfy | sh
    add_to_PATH $HOME/.nimble/bin:$PATH && nimble install nimlsp
}

setup_rust_rgrep(){
    apt_install ripgrep -y
}

setup_node_npm() {
    apt_install nodejs npm yarn -y
}

TempFolder=$HOME/neovim_setup_tmp
setup_type = parse_args

if [[ $1 == "--full" ]]; then
    bringup
    apt_install python3-pip -y
    add_to_PATH $HOME/.local/bin:$PATH && nimble install nimlsp
    setup_nvim
    setup_nim_dev
    setup_rust_rgrep
    setup_node_npm
    teardown
elif [[ $1 == "--basic" ]]; then
    bringup
    apt_install python3-pip -y
    add_to_PATH $HOME/.local/bin:$PATH && nimble install nimlsp
    setup_nvim
    setup_rust_rgrep
    setup_node_npm
    teardown
elif [[ $1 == "--minimal" ]]; then
    bringup
    setup_nvim
    setup_nvim Absolute_Minimum
    teardown
else
    echo "Oh no. Something is not right"
fi
