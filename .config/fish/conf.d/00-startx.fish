# run startx if we are in a tty1 with dwm and startx installed
if command -q dwm && command -q startx && test (tty) = "/dev/tty1"
  pgrep dwm || startx
end
