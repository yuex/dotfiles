# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git taskwarrior archlinux tmuxinator web-search pip)

# tmux plugin
#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOQUIT=false
#[ -z "$TMUX" ] && export TERM=xterm-256color

# web-search
# add google, bing, yahoo to provide search on cli

# tmuxinator, pip, extra completion

alias mux=tmuxinator

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# disable terminal flow control <C-s> and <C-q>, save two prefix for vim
stty stop ''
stty start ''
stty -ixon
stty -ixoff

# man zshzle
bindkey -N yuexmap emacs

bindkey -M yuexmap ''    backward-kill-line
#bindkey -M yuexmap 'u'   kill-line
#bindkey -M yuexmap ''  kill-whole-line
bindkey -M yuexmap ''    backward-kill-word
bindkey -M yuexmap 'w'   kill-word
bindkey -M yuexmap 'p'   up-line-or-search
bindkey -M yuexmap 'n'   down-line-or-search
bindkey -M yuexmap 'k'   history-beginning-search-backward
bindkey -M yuexmap 'j'   history-beginning-search-forward
bindkey -M yuexmap ''  vi-backward-blank-word
bindkey -M yuexmap ''  vi-forward-blank-word
bindkey -M yuexmap 'b'   vi-backward-word
bindkey -M yuexmap 'f'   vi-forward-word
bindkey -M yuexmap ''    backward-char
bindkey -M yuexmap ''    forward-char
bindkey -M yuexmap 'h'   backward-delete-char
#bindkey -M yuexmap 'l'   delete-char
bindkey -M yuexmap 'u'   up-case-word
bindkey -M yuexmap 'l'   down-case-word
bindkey -M yuexmap ''    history-incremental-pattern-search-forward
bindkey -M yuexmap ''    history-incremental-pattern-search-backward
bindkey -M yuexmap ''    clear-screen
bindkey -M yuexmap 'm'   run-help
bindkey -M yuexmap ''    get-line #be consistent with ^Q (push-line)
bindkey -M yuexmap ''  up-case-word
bindkey -M yuexmap ''  down-case-word

bindkey -M yuexmap -s 's' 'qls'
bindkey -M yuexmap -s 't'  'tmux attach -t $USER || tmux new-session -s $USER'

bindkey -A yuexmap main

# disable auto correction of zsh
unsetopt correct_all

# enable {a-z}, {0-9} in zsh
setopt braceccl

# set the right $TERM, if in pts, use 256-color, else use 8-color by default
if [ `tty|cut -d'/' -f3` = 'pts' ];then
    export TERM=xterm-256color
fi

# poor man's tmux plugin
if [ ${USER} != "root" ] && [ -z $TMUX ] && which tmux &>/dev/null; then
    if tmux has-session -t "$USER" &>/dev/null; then
        tmux new-window -t "$USER" && tmux attach -t "$USER"
    else
        tmux new-session -s "$USER"
    fi
fi

# set the color right
#autoload -U colors zsh/terminfo
if [ $terminfo[colors] -eq 256 ];then
    eval my_blue='$FG[033]'
    eval my_cyan='$FG[037]'
    eval my_green='$FG[064]'
    eval my_orange='$FG[166]'
    DIRCOLORS_SOLARIZED=~/.dircolors-solarized/dircolors.ansi-dark
    [ -f ${DIRCOLORS_SOLARIZED} ] && eval `dircolors ${DIRCOLORS_SOLARIZED}`
else
    eval my_blue='$fg[blue]'
    eval my_cyan='$fg[cyan]'
    eval my_green='$fg[green]'
    eval my_orange='$fg[yellow]'
fi

# prompt setting
function precmd {
    local loginsize=${#${(%):-[ %n@%M |  ] }}
    local timesize=${#${(%):-%*}}
    local pwdsize=${#${(%):-%~}}

    if [[ "$loginsize + $timesize + $pwdsize" -gt $COLUMNS ]]; then
        (( PWDLEN=$COLUMNS - $loginsize - $timesize ))
        if [[ $PWDLEN -le 0 ]]; then
            PWDLEN=3
        fi
    fi

    MOTTOS=`mottos $COLUMNS 2>/dev/null`
}
function setprompt {
    PROMPT='
[ $my_cyan%n%{$reset_color%}@%B$my_cyan%M%{$reset_color%}%b | %$PWDLEN<...<%~%<< ] %*
[ $my_green%B$MOTTOS%b%{$reset_color%} ]
$(git_prompt_info)%(!.#.») '

    # git settings
    ZSH_THEME_GIT_PROMPT_PREFIX="$my_blue("
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} ${my_orange}你想怎樣%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="$my_blue)%{$reset_color%} "
}

setprompt

export EDITOR=vim
alias .=source

if command -v virtualenvwrapper.sh &>/dev/null; then
    if command -v python2 &>/dev/null; then
        export VIRTUALENVWRAPPER_PYTHON=$(command -v python2)
    fi
    source $(command -v virtualenvwrapper.sh)
fi

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

_ZSHRC_PRIVATE=$HOME/.zshrc-private
[ -r "${_ZSHRC_PRIVATE}" ] && source "${_ZSHRC_PRIVATE}"
