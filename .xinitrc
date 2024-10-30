# keyring daemon for secrets
eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh | sed 's/^\(.*\)/export \1/g')

exec dbus-run-session /usr/local/bin/dwm
# exec dbus-run-session /usr/local/bin/zwm
