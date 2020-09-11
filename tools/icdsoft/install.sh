#!/bin/bash

cd "${0%/*}"
source ../lib/color.sh
color_init

color "${BLUE}Installing the following programs on this computer:"
color "${BLUE}  - HomeBrew"
color "${BLUE}  - direnv"
color "${BLUE}  - fswatch"
color "${BLUE}  - rsync"
color "${BLUE}  - ssh"
color

./install_program.sh brew
./install_program.sh direnv
./install_program.sh fswatch
./install_program.sh rsync
./install_program.sh ssh

[ "$?" -eq "0" ] && color "${GREEN}Completed successfully!"
color

./envrc.sh
