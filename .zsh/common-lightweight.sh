
#---------------------#
# PATH                #
#---------------------#
export PATH=${HOME}/bin/:$PATH

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
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -Uz colors
colors
eval `dircolors -b`; zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#---------------------#
# Prompt              #
#---------------------#
PROMPT='
%{%B%F{blue}%}#%{%b%f%} %{%F{cyan}%}%n%{%f%} in %{%B%F{yellow}%}%~%{%b%f%}
%{%B%F{red}%}$ %{%b%f%}'
# `git_echo`
# %{%B%F{red}%}$ %{%b%f%}'

#---------------------#
# Emacs               #
#---------------------#
bindkey -e
alias emacsd='env TERM=xterm emacs --daemon'
alias emacs='emacsclient -t'
alias eamcs='emacs'
alias emasc='emacs'

TERM=xterm-256color

#---------------------#
# alias               #
#---------------------#
alias ls='ls --color'
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
