# ------------------------------------------------
# file: ~/.zshrc
# vim:fenc=utf-8:ai:si:et:ts=4:sw=4:
# ------------------------------------------------

autoload -U colors && colors
zmodload -i zsh/complist

# Prompt
PROMPT="%{$fg[cyan]%}%n %{$fg_bold[blue]%}%~%{$reset_color%}
» "

# Vi style
bindkey -v
KEYTIMEOUT=1

# Show vi mode
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}"
    RPS2="$RPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

bindkey -a '^R' redo

# Completions
autoload -Uz compinit
compinit

## Case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
    zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unset CASE_SENSITIVE
else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

zstyle ':completion:*:*:*:*:*' menu select
zstyle '*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*' file-sort modification reverse
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:aliases' list-colors "=*=$color[green]"

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# history options
export HISTSIZE=1000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

bindkey "^R" history-incremental-search-backward

# if command isn't executable, try to cd to directory
setopt autocd

# magically quote urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# grep highlight
export GREP_COLOR="1;33"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colors for ls
if [[ -f ~/.dir_colors ]]; then
    eval $(dircolors -b ~/.dir_colors)
fi

# path
[ -f $HOME/.zsh/aliases.zsh ] && . $HOME/.zsh/aliases.zsh
[ -f $HOME/.zsh/functions.zsh ] && . $HOME/.zsh/functions.zsh
[ -e $HOME/.zsh/notifyosd.zsh ] && . $HOME/.zsh/notifyosd.zsh

PATH=$PATH:/home/serdotlinecho/bin

# ccache
export CCACHE_DIR="/home/serdotlinecho/.ccache"
export PATH="/usr/lib/ccache/bin/:$PATH"

# syntax highlighting
source $HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# command not found hook
source "/usr/share/doc/pkgfile/command-not-found.zsh"
