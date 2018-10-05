# ZzenlD/nextcloud-client
[![](https://images.microbadger.com/badges/version/zzenld/nextcloud-client.svg)](https://microbadger.com/images/zzenld/nextcloud-client "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/zzenld/nextcloud-client.svg)](https://microbadger.com/images/zzenld/nextcloud-client "Get your own image badge on microbadger.com")![Docker Pulls](https://img.shields.io/docker/pulls/zzenld/nextcloud-client.svg)![Docker Stars](https://img.shields.io/docker/stars/zzenld/nextcloud-client.svg)[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Builders/x86-64/x86-64-duplicati)](https://ci.linuxserver.io/job/Docker-Builders/job/x86-64/job/x86-64-duplicati/)

nextcloud-client synchronizes a directory with a local folder at regular intervals

## Usage

```
docker create \
  --name=nextcloud-client\
  -v <path to files>:/nextcloud \
  -e NEXTCLOUD_URL=<url of the nextcloud-server> \
  -e NEXTCLOUD_USERNAME=<username> \
  -e NEXTCLOUD_PASSWORD=<password> \
  zzenld/nextcloud-client
```


## Parameters

* `-v /nextcloud` - path of synchronized files
* `-e NEXTCLOUD_URL` - for url of the nextcloud-server
* `-e NEXTCLOUD_USERNAME` - for username
* `-e NEXTCLOUD_PASSWORD` - for password
* `-e NEXTCLOUD_SYNC_INTERVAL` - sync interval in seconds (default is 900)
* `-e NEXTCLOUD_TRUST_UNSECURE_CERT` - trust invalid certificates (default is false)

It is based on alpine:latest, for shell access whilst the container is running do `docker exec -it nextcloud-client /bin/bash`.


## Running nextcloud-client in read-only mode
To run nextcloud-client in read-only mode, you will need to mount a Docker volume to every location where nextcloud-client writes information. The default nextcloud-client configuration requires write access only to `/nextcloud`. This can be easily accomplished by running nextcloud-client as follows:

```console
$ docker run --read-only -v <path to files>:/nextcloud -e NEXTCLOUD_URL=<url of the nextcloud-server> -e NEXTCLOUD_USERNAME=<username> -e NEXTCLOUD_PASSWORD=<password> zzenld/nextcloud-client
```

Similar configuration in docker-compose.yml may look like this:
```yaml
version: '2'

services:
  nextcloud-client:
    image: zzenld/nextcloud-client
    container_name: nextcloud-client
    read_only: true
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
