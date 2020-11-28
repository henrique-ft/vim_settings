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
cp colors/elixir_box.vim ~/.vim/colors/elixir_box.vim
cp colors/ruby_box.vim ~/.vim/colors/ruby_box.vim
cp colors/rust_box.vim ~/.vim/colors/rust_box.vim
cd ~/.vim
git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim

echo "******************************************"
echo " "
echo " "
echo "Setup done, open vim and run :PlugInstall"
echo " "
echo " "
echo " "
echo "******************************************"

