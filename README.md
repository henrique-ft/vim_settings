# VimSettings

### Extra installations

#### SilverSearch

$ apt-get install silversearcher-ag

https://github.com/ggreer/the_silver_searcher

#### Tmux

Issues with Tmux and monokai:

To fix the issue, I have set up an alias in ~/.bashrc:

alias tmux="TERM=screen-256color-bce tmux"
And set up the default-terminal option in ~/.tmux.conf:

set -g default-terminal "xterm"
Lastly, do $ source ~/.bashrc to load new alias. Tmux

I had the same problem. Only difference was I am using solarize rather then molokai.

To fix the issue, I have set up an alias in ~/.bashrc:

alias tmux="TERM=screen-256color-bce tmux"
And set up the default-terminal option in ~/.tmux.conf:

set -g default-terminal "xterm"
Lastly, do $ source ~/.bashrc to load new alias.


