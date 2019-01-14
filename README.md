# upsideduck/nextcloud-client

nextcloud-client synchronizes a directory with a local folder at regular intervals

## Usage

```
docker create \
  --name=nextcloud-client\
  -v <path to files>:/nextcloud \
  -e NEXTCLOUD_URL=<url of the nextcloud-server> \
  -e NEXTCLOUD_USERNAME=<username> \
  -e NEXTCLOUD_PASSWORD=<password> \
  -e NEXTCLOUD_EXCLUDE=<folderlist> \
  -e PUID=<userid> \
  -e GUID=<groupid> \
  upsideduck/nextcloud-client
```


## Parameters

* `-v /nextcloud` - path of synchronized files
* `-e NEXTCLOUD_URL` - for url of the nextcloud-server
* `-e NEXTCLOUD_USERNAME` - for username
* `-e NEXTCLOUD_PASSWORD` - for password
* `-e NEXTCLOUD_EXCLUDE` - list of folders, space separated 
* `-e PUID` - run as user
* `-e GUID` - run as group
* `-e NEXTCLOUD_SYNC_INTERVAL` - sync interval in seconds (default is 900)
* `-e NEXTCLOUD_TRUST_UNSECURE_CERT` - trust invalid certificates (default is false)

It is based on alpine:latest, for shell access whilst the container is running do `docker exec -it nextcloud-client /bin/bash`.

```console
$ docker run --read-only -v <path to files>:/nextcloud -e NEXTCLOUD_URL=<url of the nextcloud-server> -e NEXTCLOUD_USERNAME=<username> -e NEXTCLOUD_PASSWORD=<password> zzenld/nextcloud-client
```

Similar configuration in docker-compose.yml may look like this:
```yaml
version: '2'

services:
  nextcloud-client:
    image: upsideduck/nextcloud-client
    container_name: nextcloud-client
    volumes:
      - <path to files>:/nextcloud
    environment:
      - NEXTCLOUD_URL=<url of the nextcloud-server>
      - NEXTCLOUD_USERNAME=<username>
      - NEXTCLOUD_PASSWORD=<password>
```

## Info

* Shell access whilst the container is running: `docker exec -it nextcloud-client /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f nextcloud-client`
