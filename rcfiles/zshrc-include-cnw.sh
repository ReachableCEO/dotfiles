#Customized zshrc 
# CNW
# Last updated 03/01/2021
# merging my own bits and some stuff from oh-my-zsh, powerline etc

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

source ~/Nextcloud/dotfiles-git/rcfiles/alias.sh

###############
#My path is where I walk, not where you walk
###############

PATHDIRS=(
~/dotfiles-git/bin
~/dotfiles-git/3rdparty/git-scripts
)

for dir in $PATHDIRS; do
		if [ -d $dir ]; then 
				path+=$dir 
		fi
done
###############
# Creature comforts 
###############

#vi 24x7 yo, this isn't a holiday inn (last night, it is now)
#
bindkey -v
set -o vi

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi


HISTSIZE=5000               #How many lines of history to keep in memory
HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
export LANG=en_US.UTF-8

#####################################################
#Personal host variables
#####################################################
#Eventually we'll move to ldap/no shared accounts/forced sudo. Blech. Corporate tyrany!
#For now, the easy way. HAH!
CON_USER="charlesnw"
INBAND_USER="charlesnw"
PERSONAL_OOB_USER="root"
PERSONAL_INBAND_USER="root"
#####################################################

source ~/Nextcloud/dotfiles-git/rcfiles/MiscEnvVars


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#DO NOT Share history across terminals
unsetopt    sharehistory      
setopt no_share_history
