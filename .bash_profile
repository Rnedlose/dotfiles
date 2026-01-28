# Load bashrc for login shells (tmux, startx, etc)
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -z $DISPLAY ] && [ $XDG_VTNR = 1 ]; then
  exec startx
fi
