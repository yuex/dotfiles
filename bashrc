#
# ~/.bashrc
#

# history alias
alias h='history 10'
alias hh='history'

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias grep='grep -i --color=auto'
alias egrep='egrep -i --color=auto'
alias fgrep='fgrep -i --color=auto'
alias tmux='TERM=screen-256color tmux'
alias curl='curl -L'
alias vim='vim -p'

export EDITOR=vim
HISTSIZE=404

PATH=$PATH:$HOME/bin:/sbin:$HOME/.gem/ruby/1.9.1/bin

# If not running interactively, stop and return
[[ $- != *i* ]] && return

# for directory stack, extend cd -. related: dirs, pushd, popd
# stack view
alias sv="dirs -v |sed '/^ 0 /d' |xargs echo"
# stack clear
alias sc="dirs -c"
alias sr="dirs"
# stack cd. push and cd to $1
sd(){ [[ $# > 0 ]] && pushd +$1 || pushd +1; }
# stack pop
spop(){ popd +$1;}
# stack push. args >=1, push args to stack; else pushd .
sp(){
    if [[ $# -ge 1 ]]
    then
        for arg
        do
            if [[ `dirname "$arg"` = '.' ]]
            then
                pushd -n "$PWD/$arg" >/dev/null
            else 
                pushd -n "$arg" >/dev/null
            fi
        done
        sv
    else 
        pushd .
    fi
}

# completion configs for bash, replaced by bash-completion
#complete -c man whatis which whereis
#complete -cf sudo exec
complete -f python python2

function prompt_dollar {
    if [[ $HOME == '/root' ]]
    then
        echo '#'
    else
        echo '$'
    fi
}
PS1='
[ \u@\[\033[1;37m\]\h\033[0m\] | \[\033[1;37m\]\W\[\033[0m\] ] \t
[ \[\033[1;32m\]`mottos`\[\033[0m\] ]
\! `prompt_dollar` '

# virtualenvwrapper settings
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
VIRTUALENV_HOME=$HOME/.virtualenv
export WORKON_HOME=$VIRTUALENV_HOME/workon
export PROJECT_HOME=$VIRTUALENV_HOME/project
source /usr/bin/virtualenvwrapper.sh

# self-defined location ab.
export PLAYGROUND=$HOME/coding/playground

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion 
# .inputrc
#set -o vi
#bind -m vi-command ".":insert-last-argument
#bind -m vi-insert "\C-l.":clear-screen
#bind -m vi-insert "\C-a.":beginning-of-line
#bind -m vi-insert "\C-e.":end-of-line
#bind -m vi-insert "\C-w.":backward-kill-word
#bind -m vi-insert "\C-p.":previous-history
#bind -m vi-insert "\C-n.":next-history
