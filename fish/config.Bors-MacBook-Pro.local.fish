set -x PATH $PATH /usr/local/opt/go/libexec/bin $HOME/.cargo/bin

set -x HOMEBREW_GITHUB_API_TOKEN (cat ~/.github-token)
set -x LESSCHARSET utf-8

set -x CHOST "x86_64-apple-darwin17.0.0"

set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/lib