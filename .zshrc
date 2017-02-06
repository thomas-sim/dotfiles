if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
    fortune | cowsay -f dragon
fi


# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# {{{ Zplug bundles
# syntaxing coloration in shell
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# some vanilla defaults
 zplug "yous/vanilli.sh"

# colorations of directories
zplug "joel-porquet/zsh-dircolors-solarized"

# vi mode for shell
zplug "plugins/vi-mode", from:oh-my-zsh

# some git aliases
zplug "plugins/git", from:oh-my-zsh

# takes advantage of emacs server option
zplug "plugins/emacs", from:oh-my-zsh

# provides the colorized command (basycally cat but with colors)
zplug "plugins/colorize", from:oh-my-zsh

# jump around plugin
zplug "plugins/z", from:oh-my-zsh
# fzf and z with C-g
zplug "andrewferrier/fzf-z"

# colorized manual
zplug "zlsun/solarized-man"
# allow the "bd" command (backward cd)
zplug "Tarrasch/zsh-bd"
# reminds you of aliases
zplug "djui/alias-tips"
# k : an ls wrapper
zplug "supercrabtree/k"

# provides the "calc" command to do basic math
zplug "vladmrnv/statify"

# jl to toggle sudo at the end of the command line
zplug "tamicasireim/zsh-sudo"

# zsh dir-scroller
zplug "sevanteri/zsh-dir-scroller"

zplug "NicoSantangelo/Alpharized", as:theme

#}}}

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load 

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
