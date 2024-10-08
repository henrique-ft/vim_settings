#!/usr/bin/env bash

sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install tmux
sudo apt-get install silversearcher-ag
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp vimrclite ~/.vimrc
echo 'export TERM=screen-256color' >> ~/.bashrc # Fiz TMUX resize problem
cp tmuxconflite ~/.tmux.conf
mkdir ~/.vim/colors
cp colors/er_box.vim ~/.vim/colors/er_box.vim
cp colors/rr_box.vim ~/.vim/colors/rr_box.vim
cp colors/err_box.vim ~/.vim/colors/err_box.vim
cp colors/err_box_darker.vim ~/.vim/colors/err_box_darker.vim
cd ~/.vim && git clone https://github.com/ctrlpvim/ctrlp.vim.git bundle/ctrlp.vim
sudo apt-get python-dev
sudo apt-get install redshift
redshift -O 4000
sudo apt-get install fonts-powerline

echo "******************************************"
echo " "
echo " "
echo "Install Rbenv? [Y,n]"
read inputrb
echo " "
echo " "
echo " "
if [[ $inputrb == "Y" || $inputrb == "y" ]]; then
  echo "******************************************"
  sudo apt-get update
  sudo apt install git curl autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  source ~/.bashrc
  rbenv install -l
  echo "******************************************"
fi

echo "******************************************"
echo " "
echo " "
echo "Install Elixir / Erlang? [Y,n]"
read inputex
echo " "
echo " "
echo " "
if [[ $inputex == "Y" || $inputex == "y" ]]; then
  echo "******************************************"
  wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
  sudo apt-get update
  sudo apt-get install esl-erlang
  sudo apt-get install elixir
  echo "******************************************"
fi

echo " "
echo " "
echo "Setup done, open vim and run :PlugInstall"
echo " "
echo " "
echo " "
echo "******************************************"
