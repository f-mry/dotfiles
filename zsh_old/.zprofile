export PATH=$PATH:~/.local/bin:~/.npm-packages/bin:~/go/bin

if systemctl -q is-active graphical.target && [[ $(fgconsole 2> /dev/null) == 1 ]]; then
   exec startx -- -keeptty &> ~/.xorg.log
fi

# if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
#       MOZ_ENABLE_WAYLAND=1 QT_QPA_PLATFORM=wayland XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
# fi

