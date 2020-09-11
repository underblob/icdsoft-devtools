#!/bin/bash

cd "${0%/*}"
source ../lib/color.sh
color_init

ERR_COUNT=0

color "${BLUE}Check system requirements for development..."

missing() {
  color "${YELLOW}$1"
  let ERR_COUNT++
}

check_installed() {
  NICE_NAME=$1
  APP_NAME=$2
  APP_URL=$3

  which $APP_NAME > /dev/null 2>&1
  [ "$?" -ne "0" ] && missing "${YELLOW}Missing ${NICE_NAME} see ${APP_URL}" || color "${GREEN}✔ ${NICE_NAME}"
}

check_installed HomeBrew brew "https://brew.sh"
check_installed direnv direnv "https://direnv.net"
check_installed fswatch fswatch "http://emcrisostomo.github.io/fswatch"
check_installed rsync rsync "https://linux.die.net/man/1/rsync"
check_installed ssh ssh "https://www.openssh.com/"

if [ "${ERR_COUNT}" -ne "0" ] ; then
  color
  color "${RED}Add the ${ERR_COUNT} missing programs above and try again."
  color "${YELLOW}Or you can magically add them all: ./tools/install.sh"
  color
  exit 1
fi

color
color "${GREEN}Looks like you're all set!"
color
