disable r
fpath=(~/.zsh $fpath)
 [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

alias desktop_on="defaults write com.apple.finder CreateDesktop -boolean false && killall Finder"
alias desktop_off="defaults write com.apple.finder CreateDesktop -boolean true && killall Finder"
alias deploy="ca; push; pm2 deploy ecosystem.json production"
alias "git commit"="git commit --verbose"
alias commit="git commit --verbose"
alias ca="git commit -a --verbose"
alias co="git commit --verbose"
alias ch="git checkout"
alias gr="grunt"
alias push="git push origin"
alias pull="git pull origin"
alias o="open"
alias naepro="ssh -D 20005 -f -N naelab"
alias mysql_stop="sudo /opt/local/bin/mysqladmin5 -u root -p shutdown"
#alias make="make -j8"
alias nginx_conf="vi /usr/local/etc/nginx/nginx.conf"
alias gl="git log --oneline --decorate --graph"
export PATH="/Users/ryohei/local/bin:/Users/ryohei/bin:/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin::/opt/X11/bin:/opt/android-ndk-r8e:/opt/local/sbin:/Applications/android-sdk-mac_x86/platform-tools:/Users/ryohei/opt/local/5.5.15/bin/:/Applications/iotdk-ide-mac/devkit-x86/sysroots/i386-pokysdk-darwin/usr/bin/i586-poky-linux"
alias random="ruby ~/gitrepos/randomimage/random.rb"

alias "si"="subl"
alias "g"="git"
alias "g ch"="git checkout"
alias "gco"="git commit"
alias "gch"="git checkout"
alias "gpl"="git pull origin"

PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-darwin
PATH=$PATH:/usr/local/mysql/bin
#nvm
# . ~/.nvm/nvm.sh
#nvm use v0.4.11

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

## Default shell configuration
#
# set prompt
#
autoload colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

# auto change directory
#
setopt auto_cd

cdpath=(. - ~ - /var/www/html - $HOME/gitrepos)

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes 
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -U compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

# alias
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -al"
alias l="ls -al"

alias du="du -h"
alias df="df -h"

alias su="su -l"

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

# ${fg[...]} や $reset_color をロード
autoload -U colors; colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#eval "$(pyenv init -)"

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
# caffe
export PYTHONPATH=$HOME/gitrepos/caffe/python:/usr/local/Cellar/opencv/2.4.9/lib/python2.7/site-packages:$PYTHONPATH

eval "$(rbenv init -)"

#export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
#	a.out
#	app.js.orig

# virtualenvwrapper
#if [ -f ~/.virtualenvwrapperrc ]; then
#      source ~/.virtualenvwrapperrc
#  fi
#
export OPENNI2_INCLUDE=/usr/local/include/ni2
export OPENNI2_REDIST=/usr/local/lib/ni2

#export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/cuda/lib:/usr/local/lib:/usr/lib:/Developer/NVIDIA/CUDA-7.0/lib:
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$HOME/go/bin
export GOPATH=$HOME/go
export PATH="/usr/local/sbin:$PATH"

export CUDA_ROOT=/Developer/NVIDIA/CUDA-7.0/
export PATH=$PATH:/Developer/NVIDIA/CUDA-7.0/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/Developer/NVIDIA/CUDA-7.0/lib
export CPATH=$CPATH:/Developer/NVIDIA/CUDA-7.0/include
export CUDA_INC_DIR=/Developer/NVIDIA/CUDA-7.0/bin:$CUDA_INC_DIR
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Developer/NVIDIA/CUDA-7.0/lib

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/iWiper_SDK_1_0/local/bin"
