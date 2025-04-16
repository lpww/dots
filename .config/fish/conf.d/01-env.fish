# set env vars

# xdg
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME; or set -gx XDG_STATE_HOME $HOME/.local/state
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME $HOME/.cache
mkdir -p $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME

# fish
set -q __fish_cache_dir; or set -gx __fish_cache_dir $XDG_CACHE_HOME/fish
test -d $__fish_cache_dir; or mkdir -p $__fish_cache_dir

# editor
set -gx PAGER less
set -gx EDITOR nvim

# ripgrep
set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/ripgrep/.ripgreprc

# atac
set -gx ATAC_MAIN_DIR $XDG_CONFIG_HOME/atac

# bun
set -gx BUN_INSTALL $HOME/.bun

# zvm
set -gx ZVM_PATH $XDG_CONFIG_HOME/zvm
set -gx ZVM_INSTALL $HOME/.zvm/self
