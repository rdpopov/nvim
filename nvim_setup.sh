wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
chmod +x nvim
sudo chown root:root nvim
curl -sL install-node.now.sh/lts | bash
sudo mv nvim /usr/bin
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install pynvim
