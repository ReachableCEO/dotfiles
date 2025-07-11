#Customized zshrc 
# CNW
# Last updated 07/11/2025
# merging my own bits and some stuff from oh-my-zsh, powerline etc

###################################
# MISE
###################################
eval "$(mise activate zsh)"
###################################



###############
#My path is where I walk, not where you walk
###############

PATHDIRS=(
/usr/local/go/bin
~/bin
~/bin/apps/habitctl/target/release
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

#######################
# All things history...
#######################


HISTSIZE=5000               #How many lines of history to keep in memory
HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=50000000           #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed
#DO NOT Share history across terminals
unsetopt    sharehistory      
setopt no_share_history

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
export LANG=en_US.UTF-8