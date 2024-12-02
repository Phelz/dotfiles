# *** ___ XDG ___ ***
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# *** ___ zsh ___ ***
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=100000                   # Maximum events for internal history
export SAVEHIST=100000                   # Maximum events in history file

# *** ___ Tmux ___ ***
export TMUX_PLUGIN_MANAGER_PATH=$XDG_CONFIG_HOME/tmux/plugins

# *** ___ Starship ___ ***
export STARSHIP_CONFIG=~/.config/starship/starship.toml


# *** ___ SSH ___ ***
