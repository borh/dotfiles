# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

unsetopt correct_all # disable autocorrect
setopt no_nomatch # if there are no matches for globs, leave them alone and execute the command
setopt no_cdable_vars # don't use named directories in cd autocompletion

export PATH=$HOME/local/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin:/usr/sbin:/sbin
export SHELL=/bin/zsh
export EDITOR=/usr/bin/vim
export MAILDIR=$HOME/Mail

alias nfc="perl -MUnicode::Normalize -CSA -E 'say NFC( qq(@ARGV) )'"
alias nfd="perl -MUnicode::Normalize -CSA -E 'say NFD( qq(@ARGV) )'"
alias nfkd="perl -MUnicode::Normalize -CSA -E 'say NFKC( qq(@ARGV) )'"

alias xtime="/usr/bin/time -f '%Uu %Ss %er %MkB %C'"
alias top="htop"
alias vi="vim"
alias tmux="tmux -2"
alias y="youtube-dl --prefer-free-formats --no-mtime -t"
alias pstree="pstree -U"

export LC_ALL=en_US.utf8
export LANGUAGE=en_US.utf8
export LANG=en_US.utf8
export TZ='Asia/Tokyo'

# IME (mozc)
# using fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
# or using ibus...
#export XMODIFIERS="@im=ibus"
#export GTK_IM_MODULE="ibus"
#export QT_IM_MODULE="ibus"
#export QT4_IM_MODULE="ibus"
#export XIM="ibus"
#export XIM_ARGS="--xim"
#export XIM_PROGRAM="/usr/bin/ibus-daemon"

# vbox
export VBOX_USB=usbfs

# sane compile flags
export CFLAGS="-O2 -march=native -pipe"
export CXXFLAGS="-O2 -march=native -pipe"
export CHOST="x86_64-pc-linux-gnu"

# go
export GOOS=linux
export GOARCH=amd64
export GOPATH=$HOME/go
#export PATH=$GOROOT/bin:$PATH

# texlive
export PATH=$HOME/texlive/bin/x86_64-linux:$PATH
unset MANPATH # unset and get from manpath directly
export MANPATH=$HOME/texlive/texmf/doc/man:$(manpath)
export INFOPATH=$HOME/texlive/texmf/doc/info:$INFOPATH

# perlbrew
source "$HOME/perl5/perlbrew/etc/bashrc"

# node.js
export NPM_PACKAGES=$HOME/node
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH
export PATH=$NPM_PACKAGES/bin:$PATH
export MANPATH=$NPM_PACKAGES/share/man:$MANPATH

# cabal
export PATH=$HOME/.cabal/bin:$PATH
export MANPATH=$HOME/.cabal/share/man:$MANPATH

# ruby gem path
export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin

# tmuxinator (depends on ruby)
export SHELL=/bin/zsh
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# xmonad
export PATH=$PATH:~/.xmonad/bin

# source local config
source $HOME/.zshrc.local
