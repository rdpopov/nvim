#!/bin/bash



add_to_PATH(){
    shell=${SHELL##*/}
    if [[ "$shell" == "zsh"]];then
        echo "PATH=$1:\$PATH">>.zshrc
    elif [[ "$shell" == "bahs" ]];then
        echo "PATH=$1:\$PATH">>.bashrc
    fi

    echo .zshrc
}

apt_install(){
    sudo apt-get install $@
}

pip_isntall(){
    pip isntall $1 && echo "installed $1"
}

gtags_ctags_source(){
    cd ~ && wget https://ftp.gnu.org/pub/gnu/global/global-6.6.tar.gz && tar -xf global-6.6.tar.gz && cd global-6.6.tar && ./configure && make && sudo make install
    sudo apt install ctags
}

setup_nvim(){
    cd ~
    echo "setting up Neovim"
    # get appimage
    wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
    # move it and make it executable
    chmod +x nvim && sudo chown root:root nvim && sudo mv nvim /usr/bin && git clone
    # get my config
    git -C ~/.config/ https://github.com/god-rosko-vs-the-bugs/nvim.git && echo "Neovim set up"
    pip3 install --user neovim
    # get vimplug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

}

setup_zsh(){
    cd ~
    sudo apt install zsh
    $ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -L git.io/antigen > antigen.zsh
    sudo mv zshrc .zshrc
}

setup_ripgrep_fzf(){
    cd ~
    # setup rust
    curl https://sh.rustup.rs -sSf | sh
    git clone https://github.com/BurntSushi/ripgrep
    cd ripgrep
    cargo build --release
    cd ..
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

setup_nim(){
    curl https://nim-lang.org/choosenim/init.sh -sSf | sh
    nimble install nimlsp
}

sudo apt install python3-pip wget curl git clang cmake fuse-libs ack python3-pip -y




