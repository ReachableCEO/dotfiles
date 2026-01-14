#CNW Customized zshrc 

# Last updated 2025-01-14

# This is running on ultix-sandbox. That is my peramment home/base of operations.
# I try to minimize interactive shell use on other systems and do everything via gitops or termix

# This files merges :
# - my own creature comforts/wants
# along with stuff from 
# - oh-my-zsh installer
# - powerline
# - powerlevl10k


# Oh-my-zsh


export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
source $ZSH/oh-my-zsh.sh









###################################################################################################################################
# CNW configuration from here
###################################################################################################################################


#############################
#############################
# Creature comforts 
#############################
#############################

#########
#VIM MODE
#########

#vi 24x7 yo, this isn't a holiday inn (ti was last night, it isn't now)
bindkey -v                                        # vi key bindings
set -o vi


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

###################################
###################################
# History configurations
###################################
###################################

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000000           #Number of history entries to save to disk
HIST_STAMPS="mm/dd/yyyy"
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
HISTDUP=erase               #Erase duplicates in the history file
setopt hist_verify            # show command with history expansion to user before running it
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

alias history="history 0" # force zsh to show the complete history

#DO NOT Share history across terminals
setopt no_share_history
unsetopt    sharehistory      

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P' # configure `time` format


###################################
###################################
# SSH related things
###################################
###################################

######################
# Bitwarden SSH Agent
######################

export SSH_AUTH_SOCK=/home/charles/.bitwarden-ssh-agent.sock


###################################
###################################
# Paths and loaders
###################################
###################################

#######
# Rust
#######

. "$HOME/.cargo/env"

#######
# MISE
#######

if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi


###################################
###################################
#Aliases...
###################################
###################################

source ~/Projects/ReachableCEO/dotfiles/zsh-configs/reachableceo-zshrc-aliases.sh





