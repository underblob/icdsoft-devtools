#!/bin/bash

cd "${0%/*}"
source ./lib/color.sh

color "${BLUE}Make .envrc from .envrc.sample"

cp ../.envrc.sample ../.envrc

[ "$?" -eq "0" ] && color "${GREEN}Done!"
