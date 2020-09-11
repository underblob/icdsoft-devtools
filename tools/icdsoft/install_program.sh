#!/bin/bash

cd "${0%/*}"
source ../lib/color.sh

PROGRAM=$1
case $PROGRAM in
  brew)
    NAME="HomeBrew"
    URL="https://brew.sh"
    ;;
  direnv)
    NAME="direnv"
    URL="https://direnv.net"
    ;;
  fswatch)
    NAME="fswatch"
    URL="http://emcrisostomo.github.io/fswatch"
    ;;
  rsync)
    NAME="rsync"
    URL="https://linux.die.net/man/1/rsync"
    ;;
  ssh)
    NAME="ssh"
    URL="https://www.openssh.com"
    ;;
  *)
  exit 1
esac

color "${BLUE}Check for ${NAME} (${URL})."
which $PROGRAM > /dev/null

if [ "$?" -eq "0" ] ; then
  color "${GREEN}${NAME} already installed!"
  color
  exit 0
fi

color "${YELLOW}${NAME} not found."
color "${YELLOW}Installing ${NAME}..."
if [ "${PROGRAM}" = "brew" ] ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew install $PROGRAM
fi

if ["$?" -ne "0" ] ; then
  color "${RED}Something went wrong during installation."
  color
  exit 0
fi;

color "${GREEN}Successfully installed ${NAME}!"