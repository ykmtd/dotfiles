
#---------------------#
# PATH                #
#---------------------#
export PATH=${HOME}/bin/:${HOME}/.local/bin:${HOME}/go/bin:$PATH

#---------------------#
# History             #
#---------------------#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

#---------------------#
# Completion          #
#---------------------#
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -Uz colors
colors
type dircolors > /dev/null && eval `dircolors -b`; zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

bindkey "^[[Z" reverse-menu-complete

#---------------------#
# Prompt              #
#---------------------#
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' formats 'on %s:%{%F{cyan}%}%b%{%f%}'
zstyle ':vcs_info:*' actionformats 'on %s:%{%F{cyan}%}%b%{%f%}'

function git_echo {
    local res color
    str=`git status --short 2> /dev/null`

    if [ -z "$vcs_info_msg_0_" ]; then
        echo ""
        return 0
    fi

    if [ -z "$str" ]; then
        res='o'
        color='%{%F{green}%}'
    elif [[ $str =~ "[\n]?\?\? " ]]; then
        res='?'
        color='%{%F{yellow}%}'
    elif [[ $str =~ "[\n]? M " ]]; then
        res='M'
        color='%{%F{red}%}'
    else
        res='A'
        color='%{%F{cyan}%}'
    fi

    echo "$vcs_info_msg_0_ ${color}${res}%{%f%}"
}

precmd() { vcs_info }
PROMPT='
%{%B%F{blue}%}#%{%b%f%} \
%{%F{cyan}%}%n%{%f%} in \
%{%B%F{yellow}%}%~%{%b%f%} \
`git_echo`
%{%B%F{red}%}$ %{%b%f%}'

#---------------------#
# Emacs               #
#---------------------#
bindkey -e
alias emacsd='env TERM=xterm emacs --daemon'
alias emacs='emacsclient -t'
alias eamcs='emacs'
alias emasc='emacs'

TERM=xterm-256color

# run server (default: disabled)
# test -e "/tmp/emacs1000/server" || test -e "~/.emasc.d/server" || emacsd

#---------------------#
# alias               #
#---------------------#
if [[ `uname` == "darwin" ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi

alias lsa='ls -al'
alias -g L='| less'
alias -g G='| grep'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

#---------------------#
# .etc                #
#---------------------#
setopt share_history
setopt extended_glob
