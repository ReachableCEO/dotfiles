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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#alias ssh='/usr/bin/ssh -F ~/Nextcloud/dotfiles-git/rcdirs/ssh/config'
#alias scp='/usr/bin/scp -F ~/Nextcloud/dotfiles-git/rcdirs/ssh/config'
#alias ssh='/usr/bin/ssh -F ~/Nextcloud/dotfiles-git/rcdirs/ssh/config'
#alias scp='scp -i /drives/c/Users/reach/.ssh/id_rsa -F ~/Nextcloud/dotfiles-git/rcdirs/ssh/config'
alias s='ssh'

#alias history='history -f'
alias vi='vim'

alias id0='sudo -i'

alias ls='ls --color'
alias grep='rg --color auto'
alias wget='wget --no-check-certificate'
alias curl='curl --insecure'
alias cls='clear ; ls'

#Git / git stuff
alias gup='git pull'
alias lpom='git add -A :/ ; git commit -va'
alias gpom=' git push --tags origin master'
alias tesla='gup;lpom;gpom'

#Docker / k8s aliases, cause i'm a docker/kubefarm fanboi now

## Most docker/k8s use is via vscode now, but somtimes you wanna drop to a shell and do some stuff...

alias dc='docker-compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcdu='docker compose up -d'
alias dcf='docker-compose rm -f ; docker-compose up'
alias dcd-prod='docker-compose --context prod up -d'
alias dcd-cicd='docker-compose --context cicd up -d'
alias dcd-dev='docker-compose --context dev up -d'

alias kgn='kubectl get nodes -o wide|grep -v NAME|sort'
alias kgp='kubectl get pods -A -o wide|grep -v NAME|sort'

alias k0-sb-gn='export KUBECONFIG=~/.kube/custom-contexts/context-sandbox-config.yml ; kgn'
alias k0-sb-gp='export KUBECONFIG=~/.kube/custom-contexts/context-sandbox-config.yml ; kgp'

alias k0-dqu-gn='export KUBECONFIG=~/.kube/custom-contexts/context-dqu-config.yml ; kgn'
alias k0-dqu-gp='export KUBECONFIG=~/.kube/custom-contexts/context-dqu-config.yml ; kgp'

alias k0-prod-gn='export KUBECONFIG=~/.kube/custom-contexts/context-prod-config.yml ; kgn'
alias k0-prod-gp='export KUBECONFIG=~/.kube/custom-contexts/context-prod-config.yml ; kgp'

#Projects

### Documentaton
alias context-docs-techops='StartProject.sh ~/charles/code/techops/docs-techops'
alias context-notes-public='StartProject.sh ~/charles/notes-public'
alias context-docs-subo='StartProject.sh ~/charles/code/RD/docs-suborbital'
alias context-docs-rr='StartProject.sh ~/charles/code/RD/docs-rackrental'

### Configs
alias context-dotfiles='StartProject.sh ~/charles/dotfiles-git'
alias context-tsys-dev='StartProject.sh ~/charles/code/techops/tsys-dev'

### Code - internal
alias context-rd-MorseFlyer='StartProject.sh ~/charles/RD/Morse/Internal/'

### Code - BizOps/TechOps
alias context-services-bizops='StartProject.sh ~/charles/code/techops/ITBackOfficeFLOStack'



#alias tmux='TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2'


#####################################################
#Personal host variables
#####################################################
#Eventually we'll move to ldap/no shared accounts/forced sudo. Blech. Corporate tyrany!
#For now, the easy way. HAH!
#CON_USER="charlesnw"
#INBAND_USER="charlesnw"
PERSONAL_OOB_USER="root"
PERSONAL_INBAND_USER="root"
#####################################################

#Functions to deploy on ultix and/or charles-prodlin...
#alias 2600hz='ssh $INBAND_USER@conference.corp.thefnf.net' 
#alias yacy='ssh $INBAND_USER@yacyfnf.corp.thefnf.net'
#alias confine='ssh $INBAND_USER@confine.dev.thefnf.net' 

#FNF hosts
alias tsys-fnf-freedomstack='ssh charles@tsys-fnf-freedomstack' #FreedomStack dev vm
alias hearth-at='ssh charles@hearth-at.thefnf.net'
alias hearth-an='ssh charles@hearth-an.thefnf.net'
alias hearth-bds='ssh charles@hearth-bds.thefnf.net'
alias hearth-uds='ssh charles@hearth-uds.thefnf.net'

#####################################################
#PFV HOSTS #####################################################
#Bare metal systems (in band access) - Production 
#Upstairs, production
alias ausprod-core-ap01='telnet ausprod-core-ap01.turnsys.net'
alias ausprod-core-sw01='telnet ausprod-core-sw01.turnsys.net'

#alias netbox='ssh -i $PATH_TO_KEY $LABUSER@netbox.dev.thefnf.net' #gns3 with ios/juniper/comware/extreme os/tinycore/openflow (ALL THE NETWORK THINGS)
#alias cudasys='ssh -i $PATH_TO_KEY $LABUSER@cudasys.dev.thefnf.net' #cuda awesomeness

###########################################################
#Inband access (ssh/telnet)				  #
###########################################################
#alias rr-con-sw4='ssh $RRLABUSER:7003@ausprod.consrv.turnsys.net'
#alias rr-con-r7='ssh $RRLABUSER:7021@ausprod-consrv.turnsys.net'
#TBDalias rr-con-r8='ssh $RRLABUSER:7021@ausprod-consrv.turnsys.net'
#TBDalias rr-con-r10='ssh $RRLABUSER:7021@ausprod-consrv.turnsys.net'
###########################################################

alias hb='habitctl'

###################################
#Marp
###################################
# Convert slide deck into HTML
alias marp-html='docker run --rm -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli slide-deck.md'
# Convert slide deck into PDF (using Chromium in Docker)
alias marp-pdf='docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli slide-deck.md --pdf'
# Convert slide deck into PPTX (using Chromium in Docker)
alias marp-pptx='docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli slide-deck.md --pptx'
# Watch mode
alias marp-watch='docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -p 37717:37717 marpteam/marp-cli -w slide-deck.md'
# Server mode (Serve current directory in http://localhost:8080/)
alias marp-serve='docker run --rm --init -v $PWD:/home/marp/app -e LANG=$LANG -p 8080:8080 -p 37717:37717 marpteam/marp-cli -s .'
###################################

alias cloudron='mise exec node@22 -- cloudron login'