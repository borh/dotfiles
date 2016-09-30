set -x PATH $HOME/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/bin/core_perl
set -x SHELL /bin/bash
set -x EDITOR /usr/bin/vim
set -x MAILDIR $HOME/Mail
set -x PAGER less

set -x SSH_ASKPASS /usr/bin/ksshaskpass

set -x XKB_DEFAULT_OPTIONS ctrl:nocaps
setxkbmap -option ctrl:nocaps

set -x XDG_CURRENT_DESKTOP kde

# envoy -t gpg-agent -a id_ecdsa.osaka
# envoy -t gpg-agent -a id_rsa.bitbucket
# envoy -t gpg-agent -a id_rsa.github
# envoy -t gpg-agent -a id_rsa.gitlab
# envoy -t gpg-agent -a id_rsa
# source (envoy -pf)

#function run_gpg-agent
#    if [ -x /usr/bin/gpg-agent ]
#        set -l PINENTRY /usr/bin/pinentry-kwallet
#        set -l GPGINFO /tmp/gpg-agent.info
#        if not pgrep -u $USER gpg-agent >/dev/null ^&1
#            gpg-agent --daemon --enable-ssh-support --pinentry-program $PINENTRY --write-env-file $GPGINFO >/dev/null
#            chmod 600 $GPGINFO
#        end
#        if [ -f $GPGINFO ]
#            for l in (cat $GPGINFO)
#                set -gx (echo $l | cut -d= -f1) (echo $l | cut -d= -f2)
#            end
#        else
#            echo 'ERROR: gpg-agent info file not found'
#        end
#    else
#        echo 'WARN: gpg-agent not found/installed'
#    end
#end

function nfc
        perl -MUnicode::Normalize -CSA -E 'say NFC( qq(@ARGV) )'
end

function nfd
        perl -MUnicode::Normalize -CSA -E 'say NFD( qq(@ARGV) )'
end

function nfkd
        perl -MUnicode::Normalize -CSA -E 'say NFKC( qq(@ARGV) )'
end

alias xtime "/usr/bin/time -f '%Uu %Ss %er %MkB %C'"
alias top "htop"
alias vi "vim"
alias tmux "tmux -2"
alias y "youtube-dl --prefer-free-formats --no-mtime -t"
alias pstree "pstree -U"

set -x LANG en_US.utf-8
set -x LANGUAGE en_US.utf-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_COLLATE en_US.utf-8
set -x LC_CTYPE en_US.utf-8
set -x LC_MESSAGES en_US.utf-8
set -x LC_MONETARY en_US.utf-8
set -x LC_NUMERIC en_US.utf-8
set -x LC_TIME en_US.utf-8
set -x LC_ALL en_US.utf-8

set -x TZ 'Asia/Tokyo'

# IME (mozc)
# using fcitx
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"
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
set -x PATH $GOPATH/bin $PATH

# texlive
set -x PATH $HOME/Dropbox/Software/texlive/2015/bin/x86_64-linux $PATH
set -x -e MANPATH # unset and get from manpath directly
set -x MANPATH $HOME/Dropbox/Software/texlive/2015/texmf/doc/man (manpath)
set -x INFOPATH $HOME/Dropbox/Software/texlive/2015/texmf/doc/info $INFOPATH

# Perl
set -x PATH /usr/bin/vendor_perl $PATH
## perlbrew
#if test -e "$HOME/perl5/perlbrew/etc/perlbrew.fish"
#    source "$HOME/perl5/perlbrew/etc/perlbrew.fish"
#end

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

## Arch Oracle JDK (AUR)
set -x JAVA_HOME /usr/lib/jvm/default
set -x LD_LIBRARY_PATH /usr/lib

alias emacs 'env LC_CTYPE=ja_JP.UTF-8 SHELL=/bin/bash emacs'

alias unidic-mecab "mecab -d /usr/lib64/mecab/dic/unidic -Ochasenu"
alias unidic-cabocha "cabocha -d /usr/lib64/mecab/dic/unidic -b /usr/lib64/mecab/dic/unidic/dicrc -r /etc/cabocharc-unidic -P UNIDIC"
alias wombat-tunnel "ssh -nNT -R 4040:localhost:22 wombat"
alias hinoki-tunnel "ssh -nNT -R 4040:localhost:22 hinoki"
alias wombat-vpn "sudo sshuttle --dns -vvr bor@wombat 0/0"

alias dmesg 'dmesg -L --reltime'

# Arch specific
# Pacman alias examples
alias pacupg 'sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin 'sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins 'sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre 'sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem 'sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep 'pacman -Si'              # Display information about a given package in the repositories
alias pacreps 'pacman -Ss'             # Search for package(s) in the repositories
alias pacloc 'pacman -Qi'              # Display information about a given package in the local database
alias paclocs 'pacman -Qs'             # Search for package(s) in the local database


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
