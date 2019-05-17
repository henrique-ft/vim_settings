# VimSettings

### Extra installations / configurations

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

#### Current branch in terminal
```
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
```
