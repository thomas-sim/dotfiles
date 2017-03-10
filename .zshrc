if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
    fortune | cowsay -f dragon
fi

source $HOME/.antigen/antigen.zsh

antigen init $HOME/.antigenrc


# Alt C to cd into selected directory
# c-R to search into history
source $HOME/.fzf.zsh

# hit fuck after a wrongly written command
eval "$(thefuck --alias)"

# vimode
bindkey -v
export KEYTIMEOUT=40
bindkey -M viins 'jk' vi-cmd-mode

# H and L to scroll dirs
bindkey -M vicmd 'H' _dir_scroller_prev
bindkey -M vicmd 'L' _dir_scroller_next

#aliases
alias v='vim'
alias grh='git reset --hard'
alias catc='colorize'
alias ect='emacsclient -nw ~/Dropbox/Notebooks/tasks.org'
alias maj='sudo apt update && sudo apt upgrade && sudo apt autoremove'
