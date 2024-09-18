# use direnv if it's found
if command -q direnv
  direnv hook fish | source
end
