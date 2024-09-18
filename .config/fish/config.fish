# everything below this only executes in interactive mode
status is-interactive || exit

# install fisher if it's not found
if not functions -q fisher
	  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
end

# use pywal fish theme if it's found
if test -e ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

# use pywal terminal theme if it's found
if test -e ~/.cache/wal/sequences
  cat ~/.cache/wal/sequences
end

# use direnv if it's found
if command -q direnv
  direnv hook fish | source
end

# use zoxide if it's found
if command -q zoxide
  zoxide init fish | source
end
