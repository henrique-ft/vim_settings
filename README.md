# VimSettings

### Run commands on startup

https://help.ubuntu.com/stable/ubuntu-help/startup-applications.html.en

### Extra installations / configurations

#### Change ESC and Capslock

setxkbmap -option caps:swapescape

#### Change to default

setxkbmap -option

#### Airline

$ git clone http://www.github.com/powerline/fonts.git
$ cd fonts
$ ./install.sh

Setar fonte Hack Regular tamanho 10

#### For Windows WSL

Download and install:

https://www.nerdfonts.com/font-downloads

After download -> right click all fonts -> click in install

#### SilverSearch

```$ apt-get install silversearcher-ag```

https://github.com/ggreer/the_silver_searcher

#### Tmux

Issues with Tmux and monokai:

To fix the issue, I have set up an alias in ```~/.bashrc```:

```alias tmux="TERM=screen-256color-bce tmux"```
And set up the default-terminal option in ```~/.tmux.conf```:

```set -g default-terminal "xterm"```
Lastly, do ```$ source ~/.bashrc``` to load new alias. Tmux

important keybinds:

Create horizontal pane:

- ctrl b "

Create vertical pane:

- ctrl b %

Resize pane:

- ctrl b :
- resize-pane -t 1 -y 9

Change panes (with Vim include):
- Alt + Arrows

Swtich to pane visual mode:

- ctrl b [

Quite pane visual mode

- q

#### Current branch in terminal

in ~/.bashrc:

```
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```
#### Only your name in terminal

in ~/.bashrc:

```
PS1="\[\e[32m\]henrique.teixeira\[\e[m\]:\[\e[34m\]\w\[\e[m\]$ "
```

### Screen recording

https://github.com/henrywoo/kazam

### Tips

https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim

#### Bugs in tabs

https://github.com/jistr/vim-nerdtree-tabs/issues/102
