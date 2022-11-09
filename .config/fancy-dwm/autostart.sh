#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "nm-applet" #network manager system tray
# run "pamac-tray" #system update system tray
# run "variety" #wallpaper changer
run "xfce4-power-manager" #power sources of computer and devices
# run "blueberry-tray" #bluetooth system tray
# run "/usr/lib/xfce4/notifyd/xfce4-notifyd" #notification service
# run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" #system wide priviledges
picom -b  --config ~/.config/fancy-dwm/picom.conf & #handle transparent windows
# run "numlockx on" #numlock on at login screen
# run "volumeicon" #pavucontrol system tray
run parcellite & #clipboard manager
run slstatus & #dwm status bar
sxhkd -c ~/.config/fancy-dwm/sxhkd/sxhkdrc & #load sxhkd (wm agnostic) shortcuts
run wal -R #restore the last used pywal theme
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &

#run applications from startup

run pipewire &
run pipewire-pulse &
