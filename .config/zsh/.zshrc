# Source
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" # zap
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf
[ -f "$ZDOTDIR/.zsh_aliases" ] && source "$ZDOTDIR/.zsh_aliases"


# Plugins
plug "zap-zsh/supercharge"
plug "zap-zsh/fzf"		
plug "Aloxaf/fzf-tab"							# Command search like fzf
plug "zap-zsh/exa"					
plug "zsh-users/zsh-autosuggestions"
plug "MichaelAquilina/zsh-you-should-use"		
plug "chivalryq/git-alias"						
plug "wintermi/zsh-starship" 					# Prompt
plug "zsh-users/zsh-syntax-highlighting"		

# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
autoload bashcompinit && bashcompinit

# enable completion features
fpath+="$ZDOTDIR/.zfunc"  # Poetry
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
# compinit

# Poetry
# autoload -Uz compinit && compinit

# bindkey ' ' magic-space                           # do history expansion on space
bindkey '^U' backward-kill-line                   # ctrl + U
bindkey '^[[3;5~' kill-word                       # ctrl + Supr
bindkey '^[[3~' delete-char                       # delete
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[H' beginning-of-line                  # home
bindkey '^[[F' end-of-line                        # end
bindkey '^[[Z' undo                               # shift + tab undo last action


# History configurations
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history         # share command history data

# configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'



# Using the starship prompt
eval "$(zoxide init zsh)"
# eval "$(atuin init zsh)" # A command history search tool (not currently using it)
# eval "$(direnv hook zsh)" # An environment switcher for the shell (not currently using it)





# Idk what these do


# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# function ranger {
# 	local IFS=$'\t\n'
# 	local tempfile="$(mktemp -t tmp.XXXXXX)"
# 	local ranger_cmd=(
# 		command
# 		ranger
# 		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
# 	)

# 	${ranger_cmd[@]} "$@"
# 	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
# 		cd -- "$(cat "$tempfile")" || return
# 	fi
# 	command rm -f -- "$tempfile" 2>/dev/null
# }
# alias rr='ranger'
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/philo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/philo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/philo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/philo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

