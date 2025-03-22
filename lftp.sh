#!/bin/bash

thread=${TUNASYNC_LFTP_CONCURRENT:-"5"}
opts=${TUNASYNC_LFTP_OPTIONS:-""}


[ ! -d "${TUNASYNC_WORKING_DIR}" ] && mkdir -p "${TUNASYNC_WORKING_DIR}"
cd ${TUNASYNC_WORKING_DIR}
lftp "${TUNASYNC_UPSTREAM_URL}" -e "mirror --verbose --skip-noaccess -P ${thread} --delete ${opts} ; bye"
sz=$(rsync -a --dry-run --stats ${TUNASYNC_WORKING_DIR} /tmp/ | grep "Total transferred file size" | awk '{ print $5}' | tr -d "," | numfmt --to=iec)
echo "Total size is ${sz}"
