#!/bin/bash
# Configure vim, install plugins, and configure plugins if needed

# Install The Silver Searcher for fast searching
brew install the_silver_searcher

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins without starting vim with vimrc
vim +PlugInstall +qall
