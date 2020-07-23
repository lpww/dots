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

#pipe to multiple outputs
setopt MULTIOS

#spell check commands
setopt CORRECT

#vim
export EDITOR=vim # added to fish

#networkmanger aliases
alias nml='nmcli d wifi list' # added to fish
alias nmd='nmcli c down $1' # added to fish
alias nmu='nmcli c up $1' # added to fish

#xrandr aliases
alias xds='xrandr --output eDP1 --off && xrandr --output HDMI1 --auto --primary && xrandr --output DP2 --off' # enable single external screen # added to fish
alias xde='xrandr --output eDP1 --off && xrandr --output HDMI1 --auto --primary && xrandr --output DP2 --auto  --right-of HDMI1' # enable dual screen # added to fish
alias xdd='xrandr --output eDP1 --auto --primary && xrandr --output HDMI1 --off && xrandr --output DP2 --off' # disable dual screen # added to fish

#conversion aliases
function videotogif(){ # added to fish
  INPUT=${1}
  OUTPUT=${2}
  ffmpeg -i $INPUT -filter_complex 'fps=10,scale=320:-1:flags=lanczos,split [o1] [o2];[o1] palettegen [p]; [o2] fifo [o3];[o3] [p] paletteuse' $OUTPUT
}
alias vtg='videotogif "$@"'

#git aliases
alias gs='git status' # added to fish
alias ga='git add' # added to fish
alias gb='git branch' # added to fish
alias gc='git commit' # added to fish
alias gd='git diff' # added to fish
alias gch='git checkout' # added to fish
alias gp='git pull' # added to fish
alias gk='gitk --all&' # added to fish
alias gx='gitx --all' # added to fish
alias gl='git log' # added to fish
alias gr='git reflog' # added to fish
alias gf='git fetch' # added to fish
alias gh='git show' # added to fish
alias glch='git log -n 1 --pretty=format:"%H"' #last commit hash # added to fish
#cleanup local branches fully merged into master
alias gcl="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs -n1 -r git branch -d" # added to fish
alias gcb='git rev-parse --abbrev-ref HEAD' #current branch # added to fish
function gfo(){ # fetch and checkout # added to fish
  BRANCH=${1}
  git fetch && git checkout $BRANCH && git pull origin $BRANCH
}

#npm aliases
alias ni='npm install' # added to fish
alias nci='npm ci' # added to fish
alias nre='rm -rf node_modules && npm install' # added to fish
alias nt='npm test' # added to fish
alias nr='npm run' # added to fish
alias nv='npm version' # added to fish
alias nli='npm link' # added to fish
alias nuli='npm unlink' # added to fish
alias nls='( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l'
alias nu='npm update' # added to fish
alias ns='npm start' # added to fish
#list globally installed packages
alias ng='npm list -g --depth=apply' # added to fish

#docker aliases
alias dcp='docker container prune' # added to fish
alias dsp='docker system prune' # added to fish
alias dvp='docker volume prune' # added to fish

#react refactor aliases
alias rrc='react-refactor-copy' # added to fish
alias rrm='react-refactor-move' # added to fish

#vim aliases
alias v='vim' # added to fish

#battery aliases
alias bat='echo $(cat /sys/class/power_supply/BAT0/capacity)"%"' # added to fish

#brightness aliases
alias bu='brightness up' # added to fish
alias bd='brightness down' # added to fish

#PIA aliases
alias piager='sudo openvpn --config /etc/openvpn/client/Germany.conf' # added to fish
alias piafr='sudo openvpn --config /etc/openvpn/client/France.conf' # added to fish
alias piauk='sudo openvpn --config /etc/openvpn/client/UK_London.conf' # added to fish
alias piauseast='sudo openvpn --config /etc/openvpn/client/US_East.conf' # added to fish
alias piauswest='sudo openvpn --config /etc/openvpn/client/US_West.conf' # added to fish

#handlr aliases
alias hg='handlr get' # added to fish
alias hl='handlr list' # added to fish
alias ho='handlr open' # added to fish
alias hs='handlr set' # added to fish

#weather
function wttr(){ # added to fish
  LOCATION=${1}
  curl 'http://wttr.in/\~'$LOCATION
}

#antibody
source <(antibody init)

#plugins
antibody bundle < ~/.zsh_plugins

#ripgrep config path
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc # added to fish

#local bin
PATH=$PATH:/usr/local/bin # added to fish

#nvm
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#go
# PATH=$PATH:$(go env GOPATH)/bin

#ruby
export GEM_HOME=$HOME/.gem
PATH=$PATH:$(ruby -r rubygems -e "puts Gem.user_dir")/bin

#the bin in the home directory should take priority
PATH=$HOME/bin:$PATH # added to fish
export PATH

