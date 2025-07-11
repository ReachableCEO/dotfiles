#alias history='history -f'
#alias ssh='/usr/bin/ssh -F ~/Nextcloud/dotfiles-git/rcdirs/ssh/config'
#alias scp='/usr/bin/scp -F ~/Nextcloud/dotfiles-git/rcdirs/ssh/config'
alias s='ssh'
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

GIT_SSH_COMMAND='ssh -i ~/Nextcloud/secrets/ssh/ReachableCEOPrivateSSHKey -o IdentitiesOnly=yes'

###########################################################
#Inband access (ssh/telnet)				  #
###########################################################
#alias rr-con-sw4='ssh $RRLABUSER:7003@ausprod.consrv.turnsys.net'
#alias rr-con-r7='ssh $RRLABUSER:7021@ausprod-consrv.turnsys.net'
#TBDalias rr-con-r8='ssh $RRLABUSER:7021@ausprod-consrv.turnsys.net'
#TBDalias rr-con-r10='ssh $RRLABUSER:7021@ausprod-consrv.turnsys.net'
###########################################################

alias hb='habitctl'

#rrom https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/
alias dfile='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
alias dadd='dfile add $1 ; dfile commit -m "added $1"'
