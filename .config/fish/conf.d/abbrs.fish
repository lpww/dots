# !!
abbr -a !! --position anywhere --function last_history_item

# brightness
abbr -a -- bu 'brightness up'
abbr -a -- bd 'brightness down'

# docker
abbr -a -- dsp 'docker system prune'
abbr -a -- dcp 'docker container prune'
abbr -a -- dvp 'docker volume prune'

# git
abbr -a -- ga 'git add'
abbr -a -- gb 'git branch'
abbr -a -- gc 'git commit'
abbr -a -- gcb 'git rev-parse --abbrev-ref HEAD'
abbr -a -- gch 'git checkout'
abbr -a -- gcl git\ branch\ --merged\ \|\ grep\ -v\ \'\\\*\\\|master\\\|develop\'\ \|\ xargs\ -n\ 1\ git\ branch\ -d
abbr -a -- gd 'git diff'
abbr -a -- gf 'git fetch'
abbr -a -- gfo 'fetch_branch'
abbr -a -- gk 'gitk --all'
abbr -a -- gl 'git log'
abbr -a -- glch 'git log -n 1 --pretty=format:%H'
abbr -a -- gp 'git pull'
abbr -a -- gr 'git reflog'
abbr -a -- gs 'git status'
abbr -a -- gsh 'git show'
abbr -a -- gx 'gitx --all'

# neovim
abbr -a -- n 'nvim'

# npm
abbr -a -- nu 'npm update'
abbr -a -- nv 'npm version'
abbr -a -- nr 'npm run'
abbr -a -- nci 'rm -rf node_modules && npm ci'
abbr -a -- nre 'rm -rf node_modules && npm install'
abbr -a -- ng 'npm list -g --depth=apply'
abbr -a -- nuli 'npm unlink'
abbr -a -- ns 'npm start'
abbr -a -- ni 'npm install'
abbr -a -- nli 'npm link'
abbr -a -- nt 'npm test'

# void
abbr -a -- vc 'void-clean'
abbr -a -- vu 'void-update'

# vim
abbr -a -- v 'vim'

# xbps
abbr -a -- xqd 'xbps-query -R'
abbr -a -- xqf 'xbps-query -f'
abbr -a -- xql 'xbps-query -l'
abbr -a -- xqrs 'xbps-query -Rs'
abbr -a -- xqs 'xbps-query -s'
abbr -a -- xis 'sudo xbps-install -S'
abbr -a -- xiu 'sudo xbps-install -Su'
abbr -a -- xrr 'sudo xbps-remove -R'

# xrandr
abbr -a -- xa 'xrandr --auto && xset s on && xset s 600'
abbr -a -- xdd 'xrandr --auto && xrandr --output HDMI1 --off && xrandr --output DP2 --off && xrandr --output eDP1 --auto --primary'
abbr -a -- xde 'xrandr --output DP1-1 --auto && xrandr --output DP1-2 --auto --right-of DP1-1 && xset s 600'
abbr -a -- xds 'xrandr --output eDP1 --off && xrandr --output HDMI1 --auto --primary && xrandr --output DP2 --off'
abbr -a -- xld 'xrandr --output eDP1 --off && xrandr --output DP1-1 --primary && xset s 600'
abbr -a -- xle 'xrandr --output eDP1 --auto --primary && xset s 600'

# yarn
abbr -a -- ya 'yarn add'
abbr -a -- yi 'yarn install'
abbr -a -- yr 'yarn run'
abbr -a -- yre 'rm -rf node_modules && yarn install'
abbr -a -- ys 'yarn start'
abbr -a -- yt 'yarn test'

# zig
abbr -a -- zb 'zig build'
abbr -a -- zbr 'zig build run'
abbr -a -- zbt 'zig build test'
abbr -a -- zie 'zig init-exe'
abbr -a -- zil 'zig init-lib'
