# pywal creates these files when a theme is set via cli
# wal --theme theme-name-to-load

# use pywal fish theme if it's found
if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

# use pywal terminal theme if it's found
if test -e ~/.cache/wal/sequences
  cat ~/.cache/wal/sequences
end
