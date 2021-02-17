#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}
#run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"
#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
#run xrandr --output eDP-1 --primary --mode 1368x768 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off
#run xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#run xrandr --output DVI-I-0 --right-of HDMI-0 --auto
#run xrandr --output DVI-1 --right-of DVI-0 --auto
#run xrandr --output DVI-D-1 --right-of DVI-I-1 --auto
#run xrandr --output HDMI2 --right-of HDMI1 --auto

run "nm-applet" #network manager system tray
run "pamac-tray" #system update system tray
run "variety" #wallpaper changer
run "xfce4-power-manager" #power sources of computer and devices
run "blueberry-tray" #bluetooth system tray
run "/usr/lib/xfce4/notifyd/xfce4-notifyd" #notification service
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" #system wide priviledges
picom -b  --config ~/.config/fancy-dwm/picom.conf & #handle transparent windows
run "numlockx on" #numlock on at login screen
run "volumeicon" #pavucontrol system tray
run parcellite & #clipboard manager
run slstatus & #dwm status bar
run xset s 600 #lock screen after 10 minutes
run xss-lock slock & # lock screen with slock
sxhkd -c ~/.config/fancy-dwm/sxhkd/sxhkdrc & #load sxhkd (wm agnostic) shortcuts
run wal -R #restore the last used pywal theme
#run "nitrogen --restore"
#run "conky -c $HOME/.config/fancy-dwm/system-overview"
#you can set wallpapers in themes as well
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &

#run applications from startup

#run "insync start"
#run "spotify"
#run "ckb-next -b"
#run "discord"
#run "telegram-desktop"
