#!/bin/sh

while true; do
  nextcloudcmd $( [ "${NEXTCLOUD_TRUST_UNSECURE_CERT}" == true ] && echo "--trust" ) --non-interactive -u "${NEXTCLOUD_USERNAME}" -p "${NEXTCLOUD_PASSWORD}" /nextcloud "${NEXTCLOUD_URL}"
  sleep "${NEXTCLOUD_SYNC_INTERVAL}"
done
