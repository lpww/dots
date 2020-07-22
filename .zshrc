#enable completion
zstyle :compinstall filename '/home/thomas/.zshrc'
autoload -Uz compinit
compinit

#prompt
export PS1="%B%C %%%b "

#autocd
setopt autocd

#enable colors
autoload colors zsh/terminfo
colors

#globs
setopt GLOB_COMPLETE
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB

#error if no match
setopt nomatch

#history
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST

#vim
export EDITOR=vim

#pipe to multiple outputs
setopt MULTIOS

#spell check commands
setopt CORRECT

#bumblebee aliases
alias gpuenable="systemctl enable bumblebeed" # requires restart
alias gpudisable="systemctl disable bumblebeed" # requires restart
alias gpustatus="cat /proc/acpi/bbswitch" # "no such file" if gpu disabled, "off" if gpu enabled

#calculator aliases
function sc(){
  bc <<< $1
}

#ergodox aliases
alias ef='teensy-loader-cli -w -v -mmcu=atmega32u4 $1'

#networkmanger aliases
alias nml='nmcli d wifi list'
alias nmd='nmcli c down $1'
alias nmu='nmcli c up $1'

#xrandr aliases
alias xds='xrandr --output eDP1 --off && xrandr --output HDMI1 --auto --primary && xrandr --output DP2 --off' # enable single external screen
alias xde='xrandr --output eDP1 --off && xrandr --output HDMI1 --auto --primary && xrandr --output DP2 --auto  --right-of HDMI1' # enable dual screen
alias xdd='xrandr --output eDP1 --auto --primary && xrandr --output HDMI1 --off && xrandr --output DP2 --off' # disable dual screen

#conversion aliases
function videotogif(){
  INPUT=${1}
  OUTPUT=${2}
  ffmpeg -i $INPUT -filter_complex 'fps=10,scale=320:-1:flags=lanczos,split [o1] [o2];[o1] palettegen [p]; [o2] fifo [o3];[o3] [p] paletteuse' $OUTPUT
}
alias vtg='videotogif "$@"'

#git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gch='git checkout'
alias gp='git pull'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gl='git log'
alias gr='git reflog'
alias gf='git fetch'
alias gh='git show'
alias glch='git log -n 1 --pretty=format:"%H"' #last commit hash
#cleanup local branches fully merged into master
alias gcl="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs -n1 -r git branch -d"
alias gcb='git rev-parse --abbrev-ref HEAD' #current branch
function gfo(){ # fetch and checkout
  BRANCH=${1}
  git fetch && git checkout $BRANCH && git pull origin $BRANCH
}

#npm aliases
alias ni='npm install'
alias nci='npm ci'
alias nre='rm -rf node_modules && npm install'
alias nt='npm test'
alias nr='npm run'
alias nv='npm version'
alias nli='npm link'
alias nuli='npm unlink'
alias nls='( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l'
alias nu='npm update'
alias ns='npm start'
#list globally installed packages
alias ng='npm list -g --depth=apply'

#patching aliases
function wpatch(){ # only works if it's the first patch on that version
  VERSION=${1}
  git fetch --tags
  git checkout shrinkwrap-$VERSION
  newb hotfix-$VERSION
  newf
}
function newb(){
  BRANCH=${1}
  git branch $BRANCH && git checkout $BRANCH && git push --set-upstream origin $BRANCH
}
function newf(){
  BRANCH=`gcb`
  git checkout -b $BRANCH'-changes'
}

#docker aliases
alias dcp='docker container prune'
alias dsp='docker system prune'
alias dvp='docker volume prune'

#baseui aliases
alias br='~/code/nearform/baseui'

#react-browser-hooks aliases
alias hr='~/code/nearform/react-browser-hooks'

#wave aliases
alias wr='~/code/wave'
alias wrr='~/code/vpn/reroute.sh ~/code/vpn/wave-reroutes'
alias wi='wave init'
alias wd='wave data -i clean'
alias wu='wave update -t top -i clean'
alias ws='ES_ENABLED=true wave start-dev'
alias waves='sudo sysctl -w vm.max_map_count=262144'

#datahub aliases
function dcc(){ # create a new component from an existing one
  SOURCE_PATH=${1}
  NEW_PATH=${2}
  SOURCE_NAME=$(basename $SOURCE_PATH)
  NEW_NAME=$(basename $NEW_PATH)
  echo creating $NEW_NAME component in $NEW_PATH
  echo based on $SOURCE_NAME component in $SOURCE_PATH
  mkdir $NEW_PATH #create new dir
  cp $SOURCE_PATH/**/* $NEW_PATH #copy source component to new path
  mv $NEW_PATH/$SOURCE_NAME.jsx $NEW_PATH/$NEW_NAME.jsx #update file name
  grep $SOURCE_NAME $NEW_PATH -lR | xargs sed -i s/$SOURCE_NAME/$NEW_NAME/g #update file contents
}
function dmc(){ # create a new component from an existing one
  SOURCE_PATH=${1}
  NEW_PATH=${2}
  SOURCE_NAME=$(basename $SOURCE_PATH)
  NEW_NAME=$(basename $NEW_PATH)
  echo moving $SOURCE_PATH to $NEW_PATH
  mv $SOURCE_PATH $NEW_PATH #move source component to new path
  mv $NEW_PATH/$SOURCE_NAME.js $NEW_PATH/$NEW_NAME.js #update file name
  grep $SOURCE_NAME $NEW_PATH -lR | xargs sed -i s/$SOURCE_NAME/$NEW_NAME/g #update file contents
}

#doom3 aliases
alias d3='dhewm3 +set fs_basepath /home/thomas/.steam/root/steamapps/common/Doom\ 3'

#vim aliases
alias v='vim'

#battery aliases
alias bat='echo $(cat /sys/class/power_supply/BAT0/capacity)"%"'

#backlight aliases
alias screen-off='sleep 1 && xset dpms force off'
alias bed='screen-off && node ~/code/mp3-speaker/index.js && amixer sset 'Master' 25%'

#brightness aliases
alias bu='brightness up'
alias bd='brightness down'

#PIA aliases
alias piager='sudo openvpn --config /etc/openvpn/client/Germany.conf'
alias piafr='sudo openvpn --config /etc/openvpn/client/France.conf'
alias piauk='sudo openvpn --config /etc/openvpn/client/UK_London.conf'
alias piauseast='sudo openvpn --config /etc/openvpn/client/US_East.conf'
alias piauswest='sudo openvpn --config /etc/openvpn/client/US_West.conf'

#weather
function wttr(){
  LOCATION=${1}
  curl 'http://wttr.in/\~'$LOCATION
}

#antibody
source <(antibody init)

#plugins
antibody bundle < ~/.zsh_plugins

#ripgrep config path
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

#local bin
PATH=$PATH:/usr/local/bin

#nvm
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#go
# PATH=$PATH:$(go env GOPATH)/bin

#ruby
export GEM_HOME=$HOME/.gem
PATH=$PATH:$(ruby -r rubygems -e "puts Gem.user_dir")/bin

#the bin in the home directory should take priority
PATH=$HOME/bin:$PATH
export PATH

