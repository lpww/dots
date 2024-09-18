# use zoxide if it's found
if command -q zoxide
  zoxide init fish | source
end
