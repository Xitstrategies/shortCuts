# shortCuts
Short cuts like git aliases, shell scripts that do things, etc.

Docs are a work in progress..

ALSO, this is not licensed, this is for my personal use only for now. Thanks!

## dockerBuild is a shortcut for docker build -t tradetech/morgan: ....
## you can run it like this, or just run dockerBuild and it will run it for front-end-build in ./../frontend_dockerbuilds/deployment/Dockerfile
dockerBuild testing123 ../dockerstuff/Dockerfile

## dockerRun is a shortcut for docker run with all the extra things that need to be remembered.
## it is save to just run this, it will give you a reminder if you forget things.
dockerRun front-end-build 1.13.15 tradetech-dev

## update_9700 is for pushing a ready change to stable for testing
update_9700 morgan 1.12.23 ~/WebstormProjects/syrinx/desktop
