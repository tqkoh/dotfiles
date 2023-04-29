
export REPOS=~/repos
export WREPOS=/mnt/c/repos
export WREPOS_OLD=/mnt/c/Users/shktm/source/repos

export CARGO_HTTP_DEBUG=true
export CARGO_LOG=cargo::ops::registry=debug
export RUST_LOG=cargo=debug cargo update
# export http_proxy=http://172.24.64.1:9999
# export https_proxy=${http_proxy}

if [ -f ~/compro.sh ]; then
    source ~/compro.sh
fi

alias reb='exec $SHELL -l'
alias clip='clip.exe'
alias paste='powershell.exe /bin/paste.ps1'
alias jikka='jikka.exe'
alias ji='jikka convert deb/in.py > deb/out.cpp'
alias tqklib="oj-verify all && cd .verify-helper/markdown && bundle config set --local path '.vendor/bundle' && bundle exec jekyll serve --incremental && cd -"
alias python=python3
alias pip=pip3
alias mtu='sudo ip link set eth0 mtu 1404'
IGNOREEOF=4


eval "$(gh completion -s bash)"

export GPG_TTY=$(tty)

export GOROOT=""
# export JAVA_HOME=~/zulu-8 ---------------------minecraft
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

export EDGEDEV="/mnt/c/Program Files (x86)/Microsoft/Edge Dev/Application/msedge.exe"
export BROWSER="$EDGEDEV"
function browse(){
  "$BROWSER" $(wslpath -w $(realpath $1))
}

export CLASSPATH=".:/usr/local/lib/antlr-4.10.1-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.10.1-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

export CURL_CA_BUNDLE=/usr/local/share/curl/cacert.pem


# export PS1="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]$ "
export PS1="\[\033[01;36m\]\W\[\033[00m\]$ "
export DOWNLOAD=/mnt/c/Users/shktm/Downloads/
# export COMPRO=/mnt/c/Users/shktm/source/repos/vscode_compro/compro/
export COMPRO=/mnt/c/Users/shktm/source/repos/ac2/
export TRASH=~/_trash
export SAVE=~/_save






if [ $SHLVL = 1 ]; then
    # tmuxにセッションがなかったら新規セッションを立ち上げた際に分割処理設定を読み込む
    alias tmux="tmux -2 attach || tmux -2 new-session \; source-file ~/.tmux/new-session"
fi

function del(){
	command mv $1 $TRASH/$1
}

function save(){
	command cp $1 _save/$1
}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# anyenv setting
# export PATH=${PATH}:/mnt/c/Windows/system32:${HOME}/.anyenv/bin:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/usr/local/bin/:/usr/local/bin/docker-compose:/home/ubuntu/registry/volumes/certs
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
# eval "$(anyenv init -)"


export DOCKER_HOST='tcp://0.0.0.0:2375'
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
. "$HOME/.cargo/env"

[ -f "/home/tqk/.ghcup/env" ] && source "/home/tqk/.ghcup/env" # ghcup-env
