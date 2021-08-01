#!/bin/bash

source ./tools/lib/color.sh
color_init

./tools/icdsoft/sync.sh

color "${BLUE}Watching for changes..."
color

eval "$(direnv export bash)"

fswatch -o "${LOCAL_SRC}" | xargs -n1 -I{} ./tools/icdsoft/sync.sh
