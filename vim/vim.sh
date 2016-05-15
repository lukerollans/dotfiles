#!/bin/bash
# Configure vim, install plugins, and configure plugins if needed

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins without starting vim with vimrc
vim +PlugInstall +qall
