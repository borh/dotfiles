set -x PATH $HOME/local/bin $HOME/.local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
set -x SHELL /bin/bash
set -x EDITOR /usr/bin/vim
set -x MAILDIR $HOME/Mail
set -x PAGER less
set -x SSH_ASKPASS /usr/bin/ksshaskpass
set -x XDG_CURRENT_DESKTOP kde
set -x QT_QPA_PLATFORMTHEME qt5ct # Seems to crash keepassxc when set to KDE
set -x XAPIAN_CJK_NGRAM 1
set -x XKB_DEFAULT_OPTIONS ctrl:nocaps
setxkbmap -option ctrl:nocaps

# Set GPG TTY
set -x GPG_TTY (tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

function nfc
         perl -MUnicode::Normalize -CSA -E 'say NFC( qq(@ARGV) )'
end

function nfd
         perl -MUnicode::Normalize -CSA -E 'say NFD( qq(@ARGV) )'
end

function nfkd
         perl -MUnicode::Normalize -CSA -E 'say NFKC( qq(@ARGV) )'
end

function pandoc-pdf
         command pandoc -f markdown -t latex -F pandoc-crossref -F pandoc-citeproc --latex-engine=lualatex -V mainfont=EquityTextA -V monofont=sourcecodeproregular -V fontsize=12pt $argv -o (string replace -r '\..+$' '.pdf' $argv)
end

alias xtime "/usr/bin/time -f '%Uu %Ss %er %MkB %C'"
alias top "htop"
alias vi "vim"
alias tmux "tmux -2"
alias y "youtube-dl --prefer-free-formats --no-mtime -t"
alias y-ios "youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' --no-mtime -t"
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

# sane compile flags
set -x CFLAGS "-O2 -march=native -pipe"
set -x CXXFLAGS "-O2 -march=native -pipe"
set -x CHOST "x86_64-pc-linux-gnu"
set -x CC_OPT_FLAGS "-march=native"

# Rust
set -x PATH $HOME/.cargo/bin $PATH

# go
set -x GOOS linux
set -x GOARCH amd64
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

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

set -x BOOT_JVM_OPTIONS '-XX:-OmitStackTraceInFastThrow -XX:+HeapDumpOnOutOfMemoryError'

alias emacs 'env LC_CTYPE=ja_JP.UTF-8 SHELL=/bin/bash emacs'

alias pg_top 'sudo -u postgres pg_top'
alias unidic-mecab "mecab -d /usr/lib64/mecab/dic/unidic -Ochasenu"
alias unidic-cabocha "cabocha -d /usr/lib64/mecab/dic/unidic -b /usr/lib64/mecab/dic/unidic/dicrc -r /etc/cabocharc-unidic -P UNIDIC"

alias dmesg 'dmesg -L --reltime'

# Load machine-specific config
source ~/.config/fish/config.(hostname).fish

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
