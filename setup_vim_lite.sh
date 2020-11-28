#!/usr/bin/env bash

sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install tmux
sudo apt-get install silversearcher-ag
sudo apt-get install lazygit
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp vimrclite ~/.vimrc
cp tmuxconflite ~/.tmux.conf
mkdir ~/.vim/colors
cp colors/oceanic_next.vim ~/.vim/colors/oceanic_next.vim
cd ~/.vim
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

echo "Setup done, open vim and run :PlugInstall"

