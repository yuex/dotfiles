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

PATH=$HOME/bin:$PATH:$HOME/.gem/ruby/2.1.0/bin

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

_DIRCOLORS_SOLARIZED=~/.dircolors-solarized/dircolors.ansi-dark
[ -f "${_DIRCOLORS_SOLARIZED}" ] && eval `dircolors "${_DIRCOLORS_SOLARIZED}"`

PS1='
[ \u@\[\033[1;37m\]\h\033[0m\] | \[\033[1;37m\]\W\[\033[0m\] ] \t
[ \[\033[1;32m\]`mottos 2>/dev/null`\[\033[0m\] ]
\! `prompt_dollar` '

# source virtualenvwrapper.sh
if command -v virtualenvwrapper.sh &>/dev/null; then
    if command -v python2 &>/dev/null; then
        export VIRTUALENVWRAPPER_PYTHON=$(command -v python2)
    fi
    source $(command -v virtualenvwrapper.sh)
fi

_BASH_COMPLETION=/usr/share/bash-completion/bash_completion
[ -r "${_BASH_COMPLETION}" ] && . "${_BASH_COMPLETION}"

_BASHRC_PRIVATE=$HOME/.bashrc-private
[ -r "${_BASHRC_PRIVATE}" ] && . "${_BASHRC_PRIVATE}"
