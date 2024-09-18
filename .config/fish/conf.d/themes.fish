# use pywal fish theme if it's found
if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

# use pywal terminal theme if it's found
if test -e ~/.cache/wal/sequences
  cat ~/.cache/wal/sequences
end
