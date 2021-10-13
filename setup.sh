#!/bin/bash
# presumed for ubuntu-based systems

apt_install(){
    sudo apt-get install  $@ -y
}

setup_deps(){
    apt_install fuse libfuse2 git python3-pip ack-grep curl
    apt_install ripgrep
}

setup_nvim(){
    wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
    chmod +x nvim && sudo chown root:root nvim && sudo mv nvim /usr/bin
    pip3 install --user neovim
    [ -d "$HOME/.undodir" ]  || mkdir $HOME"/.undodir"
}


update_plug(){
  if command -v curl; then
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    if command -v wget; then
      wget --quiet https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim --output-document ~/.config/nvim/autoload/plug.vim
    else
      echo "> neither wget or curl exist."
      echo "what do?"
      exit -1
    fi
  fi
}

setup_tmux(){
    [ -e "$HOME/.tmux.conf" ] && mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
    cp dots/tmux.conf $HOME/.tmux.conf
    [ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://www.github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm #tmux package manager
    [[ $(grep ~/.bashrc -e env\.sh -c) == "0" ]] && echo "source ~/.config/nvim/dots/env.sh" >> ~/.bashrc || echo "already in .bashrc"
}
setup_quoty(){
    [ -d "$HOME/.config/quoty" ] && cd $HOME/.config/quoty/; git stash; git pull || cd $HOME/.config/;git clone https://www.github.com/rdpopov/quoty
}

setup_alac(){
    [ -e "$HOME/alacritty.yml" ] && mv $HOME/.alacritty.yml $HOME/.alacritty.yml.bak
    cp dots/alacritty.yml $HOME/.alacritty.yml
}

if [[ $# == "0" ]]; then 
  echo -e "Usage:";
  echo -e "   --alac,-a\t setup alacritty ";
  echo -e "   --tmux,-t\t sets up tmux and which requires quoty(optionally)"
  echo -e "   --quoty,-q\t sets up quoty"
  echo -e "   --nvim,-n\t sets up neovim latest appimage"
  echo -e "   --deps,-d\t sets up dependacies for neovim"
  echo -e "   --all,-A\t sets up all of the above for neovim"
  exit 0;
else
  for arg in "$@";do
    case "$arg" in
      "--quoty" | "-q" )
        setup_quoty
        ;;
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
      "--plug" | "-p" )
        update_plug
        ;;
      "--all" | "-A" )
        setup_deps
        setup_nvim
        update_plug
        setup_tmux
        setup_alac
        ;;
      *)
        echo -e "Usage:";
        echo -e "   --alac,-a\t Setup alacritty.";
        echo -e "   --tmux,-t\t Sets up tmux and which requires quoty(optionally)."
        echo -e "   --quoty,-q\t Sets up quoty."
        echo -e "   --nvim,-n\t Sets up neovim latest appimage."
        echo -e "   --deps,-d\t Sets up dependacies for neovim."
        echo -e "   --plug,-p\t Gets new version of vim-plug."
        echo -e "   --all,-A\t Sets up all of the above for neovim."
        exit 0
        ;;
    esac
  done
fi
