# exit if not in interactive
status is-interactive || exit

# install fisher and plugins if not found
if not functions -q fisher
	  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
end
