#!/bin/bash
# Installs latest neovim appimage will clobber existing one
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
chmod +x nvim && sudo chown root:root nvim && sudo mv nvim /usr/local/bin
