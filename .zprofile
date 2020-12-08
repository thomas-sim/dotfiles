
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
