# ~/.bashrc: executed by bash(1) for non-login shells.
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
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

function cd {
    builtin cd "$@" && ls -F
    }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias config='/usr/bin/git --git-dir=/home/cloud_user/.cfg/ --work-tree=/home/cloud_user'
source /etc/profile.d/bash_completion.sh
