#!/bin/bash
source essential.sh

add_to_PATH(){
    shell=${SHELL##*/}
    if [["$shell" == "zsh"]];then
        echo "PATH=$1:\$PATH">>.zshrc
    elif [[ "$shell" == "bahs" ]];then
        echo "PATH=$1:\$PATH">>.bashrc
    fi
}

setup_g_c_tags(){
    package_install ctags
    package_install global
    echo
}

setup_vimplug(){
    cd ~
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -fLo ~/.local/share/vim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo
}

setup_fzf(){
    fzfV=$(fzf --version)
    $? && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
}

setup_rust(){
    cd ~
    rust=$(cargo --version)
    $? && $(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh ) && add_to_PATH ~/.cargo/bin
}
setup_ripgrep(){
    setup_rust
    cd ~
    git clone https://github.com/BurntSushi/ripgrep
    cd ripgrep
    cargo build --release
    ./target/release/rg --version
    add_to_PATH ~/ripgrep/target/release
    echo
}

setup_nim(){
    cd ~
    safe_exec curl https://nim-lang.org/choosenim/init.sh -sSf | sh
    safe_exec nimble install nimlsp
    safe_exec add_to_PATH ~/.nimble/bin
}

compile_snippet_generators(){
    #TODO compile all sophisticated snippet generators in snippet folder 
    ##TODO write said generators 
    echo
}

setup_qtile(){
    pip install xcffib
    pip install --no-cache-dir cairocffi
    package_install libpangocairo-1.0-0

}


setup_nvim(){
    wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
    chmod +x nvim
    sudo chown root:root nvim
    sudo mv nvim /usr/bin
    cd ~
    mkdir -p .config/nvim
    pip3 install --user pynvim
    setup_vimplug
    echo
}
get_pip

package_install wget curl git clang cmake fuse-libs ack ranger -y

setup_nvim
setup_fzf
setup_ripgrep
setup_g_c_tags
setup_nim
compile_snippet_generators
