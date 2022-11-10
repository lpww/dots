# automatically run startx if we are in the default tty
if test (tty) = "/dev/tty1"
  pgrep dwm || startx
end

# install fisher if it's not found
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# use pywal fish theme if it's found
if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

# use pywal terminal theme if it's found
if test -e ~/.cache/wal/sequences
  cat ~/.cache/wal/sequences
end
