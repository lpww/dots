#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

# policy kit
run "/usr/libexec/polkit-gnome-authentication-agent-1" # system wide priviledges

# status bar / systray
run slstatus & #dwm status bar
run parcellite & #clipboard manager
run "nm-applet" #network manager system tray
run "xfce4-power-manager" #power sources of computer and devices

#notifications
run dunst &

# transparent windows
run picom -b  --config ~/.config/fancy-dwm/picom.conf & #handle transparent windows

# keyboard
run sxhkd -c ~/.config/fancy-dwm/sxhkd/sxhkdrc & #load sxhkd (wm agnostic) shortcuts

# theme
run wal -R #restore the last used pywal theme
feh --bg-fill ~/backgrounds/dkeg-vans.jpg

# register screen locker
run xss-lock slock & # lock screen with slock

# audio
run pipewire &
run wireplumber &
run pipewire-pulse &
