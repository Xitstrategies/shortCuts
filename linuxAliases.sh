#!/bin/sh

#linux
alias c=clear
alias ls='ls --color=auto'
alias l='ls -la'


#data engine
alias stopDE='(. dotMe && stopDE)'
alias checkDE='(ps faux | grep Data && ls -la /var/run/DataEngine/ && ls -la /var/spool/keywordUpdates/)'


#locally
#alias vb='ssh -p 5679 root@localhost' #for accessing the virtualbox for docker
