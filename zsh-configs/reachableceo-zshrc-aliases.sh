

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


###################################################
# SSH shortcuts
###################################################

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



###########################################################
# Project context aliases
###########################################################

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

##############################################################
#Docker / k8s aliases, cause i'm a docker/kubefarm fanboi now
##############################################################

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


#############################################################
# Command aliases...
#############################################################

alias hb='habitctl'

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