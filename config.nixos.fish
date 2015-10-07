set -x PATH /var/setuid-wrappers $HOME/local/bin /home/bor/.nix-profile/bin /home/bor/.nix-profile/sbin /home/bor/.nix-profile/usr/bin /home/bor/.nix-profile/lib /nix/var/nix/profiles/default/bin /nix/var/nix/profiles/default/sbin /run/current-system/sw/bin /run/current-system/sw/sbin
set -x LD_LIBRARY_PATH "/home/bor/.nix-profile/lib:/run/current-system/sw/lib:$LD_LIBRARY_PATH"
set -x SHELL /run/current-system/sw/bin/bash
set -x EDITOR /run/current-system/sw/bin/nvim
set -x MAILDIR $HOME/Mail
set -x PAGER less

function nfc
        perl -MUnicode::Normalize -CSA -E 'say NFC( qq(@ARGV) )'
end

function nfd
        perl -MUnicode::Normalize -CSA -E 'say NFD( qq(@ARGV) )'
end

function nfkd
        perl -MUnicode::Normalize -CSA -E 'say NFKC( qq(@ARGV) )'
end

alias xtime "/run/current-system/sw/bin/time -f '%Uu %Ss %er %MkB %C'"
alias top "htop"
alias vi "nvim"
alias vim "nvim"
alias tmux "tmux -2"
alias y "youtube-dl --prefer-free-formats --no-mtime -t"
alias pstree "pstree -U"

set -x LC_ALL en_US.utf8
set -x LANGUAGE en_US.utf8
set -x LANG en_US.utf8
set -x TZ 'Asia/Tokyo'

# IME (mozc)
# using ibus
set -x GTK_IM_MODULE ibus
set -x QT_IM_MODULE ibus
set -x XMODIFIERS "@im=ibus"
set -x LOO_FORCE_DESKTOP gnome
set -x OOO_FORCE_DESKTOP gnome

# vbox
set -x VBOX_USB usbfs

# sane compile flags
set -x CFLAGS "-O2 -march=native -pipe"
set -x CXXFLAGS "-O2 -march=native -pipe"
set -x CHOST "x86_64-pc-linux-gnu"

# go
set -x GOOS linux
set -x GOARCH amd64
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $GOBIN $PATH

# texlive
set -x PATH $HOME/Dropbox/Software/texlive/2015/bin/x86_64-linux $PATH
#set -x -e MANPATH # unset and get from manpath directly
#set -x MANPATH $HOME/Dropbox/Software/texlive/2015/texmf/doc/man (manpath)
set -x INFOPATH $HOME/Dropbox/Software/texlive/2015/texmf/doc/info $INFOPATH

## perlbrew
#if [ -f "$HOME/perl5/perlbrew/etc/bashrc" ]; then
#    source "$HOME/perl5/perlbrew/etc/bashrc"
#fi

# node.js
set -x NPM_PACKAGES $HOME/node
set -x NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
set -x PATH $NPM_PACKAGES/bin $PATH
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH

# cabal
set -x PATH $HOME/.cabal/bin $PATH
set -x MANPATH $HOME/.cabal/share/man $MANPATH

# ruby gem path
set -x PATH $PATH (ruby -rubygems -e "puts Gem.user_dir")/bin

# Android
set -x ANDROID_HOME /opt/android-sdk
set -x ANDROID_SWT /usr/share/java
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH /opt/android-sdk/platform-tools
# local config

# JDK
#set -x JAVA_HOME /usr/lib/jvm/default
#set -x LD_LIBRARY_PATH /usr/lib
set -x CLASSPATH "/home/bor/.nix-profile/lib/:/run/current-system/sw/lib:$CLASSPATH"

alias emacs 'env LC_CTYPE=ja_JP.UTF-8 SHELL=/run/current-system/sw/bin/bash emacs'

alias unidic-mecab "mecab -d /usr/lib64/mecab/dic/unidic -Ochasenu"
alias unidic-cabocha "cabocha -d /usr/lib64/mecab/dic/unidic -b /usr/lib64/mecab/dic/unidic/dicrc -r /etc/cabocharc-unidic -P UNIDIC"
alias wombat-tunnel "ssh -nNT -R 4040:localhost:22 wombat"
alias hinoki-tunnel "ssh -nNT -R 4040:localhost:22 hinoki-project.org"
alias wombat-vpn "sudo sshuttle --dns -vvr bor@wombat 0/0"

alias dmesg 'dmesg -L --reltime'

set fish_color_autosuggestion '666'  'green'
set fish_color_command afffff
set fish_color_comment red
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_error 'red'  '--bold'
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host '-o'  'cyan'
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param '00afff'  'cyan'
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match --background=purple
set fish_color_status red
set fish_color_user '-o'  'green'
set fish_color_valid_path --underline
