# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

source /usr/share/nvm/init-nvm.sh

MISSING_UTIL=""

# FASD configuration
if type fasd &> /dev/null; then
  eval "$(fasd --init auto)"
else
  MISSING_UTILS+="fasd "
fi

# FZF configuration
if type fzf &> /dev/null; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
  if type rg &> /dev/null; then
      export FZF_DEFAULT_COMMAND='rg --files --hidden'
  fi
else
  MISSING_UTILS+="fzf "
fi

alias cfg='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [ ! -z "$MISSING_UTILS" ]; then
  echo "missing utils. Please install them. pacman -Syu $MISSING_UTILS"
fi

