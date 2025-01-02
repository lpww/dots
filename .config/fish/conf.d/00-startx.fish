# run startx if we are in a tty1 with startx installed and dwm is not already running
if command -q startx && test (tty) = "/dev/tty1"
  pgrep dwm || startx
end

# run wayland (via river compositor) if we are in tty1 and there is no other compositor running
if test -z $WAYLAND_DISPLAY && test (tty) = "/dev/tty1"
  # keyring daemon for secrets
  eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh | sed 's/^\(.*\)/export \1/g')

  # run hazy in a dbus session with alacritty as the open window
  # exec dbus-run-session /home/thomas/code/hazy/zig-out/bin/hazy ghostty

  # run river in a dbus session
  # exec dbus-run-session /usr/bin/river
end
