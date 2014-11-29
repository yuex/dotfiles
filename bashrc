#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for C-xC-e edit-and-execute-command
declare -x EDITOR=vim
HISTSIZE=404

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

PATH=$PATH:$HOME/bin:/sbin:$HOME/.gem/ruby/1.9.1/bin

# completion configs for bash, replaced by bash-completion
#complete -c man whatis which whereis
#complete -cf sudo exec
complete -f python python2

if [ `which fortune 2>/dev/null` ]; then
    MOTTOS_FILE=$HOME/.mottos/mottos
    if [ -r ${MOTTOS_FILE} ]; then
        strfile ${MOTTOS_FILE}{,.dat} &> /dev/null
    else
        echo "no fortune file ${MOTTOS_FILE}" >/dev/stderr
    fi
    function mottos {
        if [ -r ${MOTTOS_FILE}.dat ]
        then
            echo '[ \e[30;47m\e[0m\e[32;32;1m`fortune 100% $MOTTOS_FILE 2>/dev/null`\e[0m ]\n'
        fi
    }
else
    echo "command fortune not found" >/dev/stderr
    function mottos { echo 'nop\n'; }
fi
function prompt_dollar {
    if [[ $HOME == '/root' ]]
    then
        echo '#'
    else
        echo '\$'
    fi
}
#PS1="\n[ \u@\e[37;37;1m\h\e[0m | \e[37;37;1m\W\e[0m ] \t\n`mottos`\! `prompt_dollar` "
PS1="\n[ \u@\[\033[1;37m\]\h\033[0m\] | \[\033[1;37m\]\W\[\033[0m\] ] \t\n`mottos`\! `prompt_dollar` "

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
