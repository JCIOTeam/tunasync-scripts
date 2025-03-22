#!/bin/bash

[ ! -d "${TUNASYNC_WORKING_DIR}" ] && mkdir -p "${TUNASYNC_WORKING_DIR}"
cd ${TUNASYNC_WORKING_DIR}
wget --mirror -np -c -R index.html,*.1 --directory-prefix="${TUNASYNC_WORKING_DIR}" -nH --cut-dirs=2 "${TUNASYNC_UPSTREAM_URL}"
