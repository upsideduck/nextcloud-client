#!/bin/ash

# ensure, that the sync dir exists and is owned by the user
#[ -d /nextcloud ] || mkdir -p /nextcloud
echo "chown $USER:$USER /nextcloud"
chown -R $USER:$USER /nextcloud

for i in $TEMP
do
    echo $i >> /exclude.lst
done

while true; 
do
  /bin/su -s /bin/ash $USER -c 'nextcloudcmd $( [ "${NEXTCLOUD_TRUST_UNSECURE_CERT}" == true ] && echo "--trust" ) --non-interactive --unsyncedfolders /exclude.lst -u "${NEXTCLOUD_USERNAME}" -p "${NEXTCLOUD_PASSWORD}" /nextcloud "${NEXTCLOUD_URL}"'
  sleep "${NEXTCLOUD_SYNC_INTERVAL}"
done
