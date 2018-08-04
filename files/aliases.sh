#!/bin/sh

# Funky stuff
alias meteo="clear && curl -4 http://wttr.in/London"

alias tmon="tmux set mouse on"
alias tmoff="tmux set mouse off"

alias todos="rg -i @todo | tee >(wc -l)"

#
# Docker
#
alias dc="docker-compose"



#
# zsh aliases
#
alias aliases="vim ~/Dotfiles/files/aliases.sh"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"
alias blog="cd ~/Code/christophegraniczny.com && vim ."

alias ks="tmux kill-session"

alias x="exit"
alias q="exit"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"


#
# Git
#
alias nah="git reset --hard && git clean -df"
alias g="git status"
alias gt="git tag"
alias gap="git add -p"
alias gitclean='git branch --merged dev | grep -v "\dev" | xargs -n 1 git branch -d'



#
# VIM & Tmux
#
alias v="vim ."
alias tor="tmuxinator"


#
# Tmuxinator
#
alias tor="tmuxinator"


#
#        PHP aliases
#
alias u="vendor/bin/phpunit"
alias wip="vendor/bin/phpunit --group wip"
alias art="php artisan"



#
#       LL stuff
#
alias binll="./bin/ll --schooldb=ll"
# alias llsql="mysql -h db -u root ll -p"
alias llsql="mysql -h db -u root ll"
alias llmigrate="./bin/ll --schooldb=ll l:d:m:m"
alias lahsql="mysql -h db -P 3308 -u root llah"



#
# Vagrant
#
alias vdestup="vagrant destroy -f && vagrant up"


#
#    Yarn stuff
#
alias yt="yarn test"
