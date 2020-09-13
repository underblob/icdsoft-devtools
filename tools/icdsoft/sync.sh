#! /bin/bash

source ../tools/lib/color.sh
color_init

color "${BLUE}SYNC"
color

PARENT_COMMAND=$(ps -o comm= $PPID)
color "${BLUE}Parent command: ${YELLOW}${PARENT_COMMAND}"
if [ "${PARENT_COMMAND}" != "xargs" ] ; then
  eval "$(direnv export bash)"
fi

SRC="${LOCAL_SRC}"
DEST="${SSH_USER}@${SSH_HOST}:${REMOTE_DEST}"

color "${BLUE}Sync from local: ${YELLOW}${SRC}"
color "${BLUE}Push to remote: ${YELLOW}${DEST}"

# To fix: rsync: failed to set permissions on " ... "
# add arguments: --omit-dir-times --no-perms
rsync -aq \
  --exclude=.git \
  --exclude-from=.gitignore \
  --omit-dir-times \
  --no-perms \
  --rsh="ssh -i ${SSH_PRIVATE_KEY}" \
  "${SRC}" "${DEST}"

color "${GREEN}Done."
