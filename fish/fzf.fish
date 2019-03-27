set -x FZF_DEFAULT_COMMAND 'fd --type f'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

function fzf-bcd-widget -d 'cd backwards'
    pwd | awk -v RS=/ '/\n/ {exit} {p=p $0 "/"; print p}' | tac | eval (__fzfcmd) +m --select-1 --exit-0 $FZF_BCD_OPTS | read -l result
    [ "$result" ]; and cd $result
    commandline -f repaint
end

function fzf-cdhist-widget -d 'cd to one of the previously visited locations'
    # Clear non-existent folders from cdhist.
    set -l buf
    for i in (seq 1 (count $dirprev))
	set -l dir $dirprev[$i]
	if test -d $dir
	    set buf $buf $dir
	end
    end
    set dirprev $buf
    string join \n $dirprev | tac | sed 1d | eval (__fzfcmd) +m --tiebreak=index --toggle-sort=ctrl-r $FZF_CDHIST_OPTS | read -l result
    [ "$result" ]; and cd $result
    commandline -f repaint
end

function fco -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf-tmux | read -l result; and git checkout "$result"
end

function fcoc -d "Fuzzy-find and checkout a commit"
    git log --pretty=oneline --abbrev-commit --reverse | fzf-tmux --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end

function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
    rg --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf-tmux | read -l result; and ssh "$result"
end

function fs -d "Switch tmux session"
    tmux list-sessions -F "#{session_name}" | fzf-tmux | read -l result; and tmux switch-client -t "$result"
end

function fzf-history
    history | fzf-tmux --height 40% | read -l result; and eval "$result"
end

function fish_user_key_bindings
    bind \cr fzf-history
    bind \co fzf-tmux
end
