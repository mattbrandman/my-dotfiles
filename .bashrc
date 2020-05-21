# Don't do anything if not interactive
case $- in
    *i*) ;;
      *) return;;
esac

# ~/.bashrc: executed by bash(1) for non-login shells.
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Source bash files
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /etc/profile.d/bash_completion.sh 
source <(kubectl completion bash)


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

function cd {
    builtin cd "$@" && ls -F
    }

export FZF_COMPLETION_TRIGGER=?
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace'
alias k=kubectl
complete -F __start_kubectl k
