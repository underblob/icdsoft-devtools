#!/bin/bash

source ./tools/lib/color.sh
color_init

INSTALL_PATH=$1

color "${BLUE}INSTALL ICDSOFT DEVTOOLS"
color
color "${BLUE}Install path: ${YELLOW}${INSTALL_PATH}"

color "${BLUE}Copy files"
mkdir -p "${INSTALL_PATH}/tools"
cp ./.envrc.sample "${INSTALL_PATH}" > /dev/null 2>&1
cp -r ./tools/lib "${INSTALL_PATH}/tools"
cp -r ./tools/icdsoft "${INSTALL_PATH}/tools"

color "${GREEN}Done."
color
