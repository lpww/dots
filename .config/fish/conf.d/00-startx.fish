# run startx if we are in a tty1 with startx installed and dwm is not already running
if command -q startx && test (tty) = "/dev/tty1"
  pgrep dwm || startx
end
