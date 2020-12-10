# Created by newuser for 5.5.1
TERM=xterm-256color

PATH="$HOME/.local/bin/:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if type fzf &> /dev/null; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
    if type rg &> /dev/null; then
      export FZF_DEFAULT_COMMAND='rg --files'
      export FZF_DEFAULT_OPTS='-m --border'
    fi
fi

if type fasd &> /dev/null; then
    eval "$(fasd --init auto)"
fi

if type bat &> /dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# export MANPAGER='nvim -u NORC +Man!'

scpvps_temp () {
    scp $1 pg:/var/www/souslesondes/temp/.
    echo https://temp.souslesondes.fr/"$1"
    echo https://temp.souslesondes.fr/"$1" | xclip -selection clipboard
}

afterwriting_convert() {
    afterwriting --overwrite --source $1 --pdf ${1%.*}.pdf
}

alias config='/usr/bin/git --git-dir=/home/enes/.dotfiles/ --work-tree=/home/enes'
