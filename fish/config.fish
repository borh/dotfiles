set -x PATH $HOME/local/bin $HOME/.local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
set -x SHELL /bin/bash
set -x EDITOR /usr/bin/vim
set -x MAILDIR $HOME/Mail
set -x PAGER less

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
        command pandoc -f markdown -t latex -N --listings --biblatex -F pandoc-crossref -F pandoc-citeproc --pdf-engine=lualatex --bibliography ~/Projects/homepage/content/bibliography.bib -V mainfont=EquityTextA -V monofont=sourcecodeproregular -V fontsize=12pt $argv -o (string replace -r '\..+$' '.pdf' $argv)
end

function pandoc-pdf-ja
        command pandoc -f markdown -t latex -N --listings --biblatex -F pandoc-crossref -F pandoc-citeproc --pdf-engine=lualatex --bibliography ~/Projects/homepage/content/bibliography.bib -V mainfont=SourceHanSansJP -V monofont=sourcecodeproregular -V fontsize=12pt $argv -o (string replace -r '\..+$' '.pdf' $argv)
end

function pandoc-simple
        set -l base_filename (basename -s .md $argv)
        set -l tex_filename (string replace -r '\..+$' '.tex' $argv)
        command pandoc -f markdown -t latex --slide-level=2 -N --biblatex -F pandoc-crossref --pdf-engine=lualatex --bibliography ~/Projects/homepage/content/bibliography.bib -s $argv -o $tex_filename
        command lualatex --interaction=nonstopmode --shell-escape $tex_filename
        command biber $base_filename
        command lualatex --interaction=nonstopmode --shell-escape $tex_filename
        command lualatex --interaction=nonstopmode --shell-escape $tex_filename
        command rm $base_filename.{aux,bbl,bcf,blg,log,out,run.xml,toc} texput.log
end

function pandoc-platex
    set -l base_filename (basename -s .md $argv)
    set -l tex_filename (string replace -r '\..+$' '.tex' $argv)
    command pandoc -f markdown -t latex --template ~/.pandoc/templates/default.platex -N --biblatex -F pandoc-crossref --natbib --bibliography ~/Projects/homepage/content/bibliography.bib -s $argv -o $tex_filename
    command platex -kanji=utf8 --shell-escape --interaction=batchmode $tex_filename
    command upbibtex -kanji=utf8 $base_filename
    command platex -kanji=utf8 --shell-escape --interaction=batchmode $tex_filename
    command platex -kanji=utf8 --shell-escape --interaction=batchmode $tex_filename
    command xdvipdfmx $base_filename
    command rm $base_filename.{aux,bbl,blg,log,out,dvi}
end

function pandoc-beamer
    set -l base_filename (basename -s .md $argv)
    set -l tex_filename (string replace -r '\..+$' '.tex' $argv)
    command pandoc -f markdown-smart -t beamer+smart --template ~/.pandoc/templates/default.beamer -N --listings --biblatex -F pandoc-crossref --pdf-engine=lualatex --bibliography ~/Projects/homepage/content/bibliography.bib -s $argv -o $tex_filename
    command lualatex --interaction=nonstopmode --shell-escape $tex_filename
    command biber $base_filename
    command lualatex --interaction=nonstopmode --shell-escape $tex_filename
    command lualatex --interaction=nonstopmode --shell-escape $tex_filename
    command rm $base_filename.{aux,bcf,log,out,run.xml,toc}
end

function build-tensorflow
        git pull
        bazel clean
        env PYTHON_BIN_PATH=(which python) PYTHON_LIB_PATH=(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") ./configure
        bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
        bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
        pip install -I /tmp/tensorflow_pkg/tensorflow-1.4.0rc1-cp35-cp35m-linux_x86_64.whl
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

# cabal
set -x PATH $HOME/.cabal/bin $PATH

# ruby gem path
set -x PATH $PATH (ruby -e "puts Gem.user_dir")/bin

set -x ANDROID_HOME $HOME/Android/Sdk
alias android-studio "env LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' android-studio"

set -x BOOT_JVM_OPTIONS '-XX:-OmitStackTraceInFastThrow -XX:+HeapDumpOnOutOfMemoryError'

alias emacs 'env LC_CTYPE=ja_JP.UTF-8 SHELL=/bin/bash emacs'
alias emacsclient 'env LC_CTYPE=ja_JP.UTF-8 SHELL=/bin/bash emacsclient'

alias pg_top 'sudo -u postgres pg_top'
alias unidic-mecab "mecab -d /usr/lib64/mecab/dic/unidic -Ochasenu"
alias unidic-cabocha "cabocha -d /usr/lib64/mecab/dic/unidic -b /usr/lib64/mecab/dic/unidic/dicrc -r /etc/cabocharc-unidic -P UNIDIC"

alias dmesg 'dmesg -L --reltime'

alias nheko 'env QT_SCALE_FACTOR=2 nheko'

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
