#!/bin/bash

# Script created by maki-color.
# See https://github.com/underblob/maki-color

PRE='\033[0;240;2m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
END='\033[0m'

color_init() {
  clear
  echo -e "\n ${BLUE}PROCESS ${GREEN}SUCCESS ${YELLOW}WARN ${RED}FAIL ${END} \n"
}

color() {
  ORIGIN="${PRE}${0} » ${END}"
  [ "${COLOR_ORIGIN}" = "false" ] || [ "${COLOR_ORIGIN}" = "0" ] && ORIGIN=""
  echo -e "${ORIGIN}$1${END}"
}
