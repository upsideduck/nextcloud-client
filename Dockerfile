FROM alpine:latest
MAINTAINER ZzenlD

RUN apk add --no-cache nextcloud-client \
    mkdir /nextcloud

ADD run.sh /run.sh

ENV NEXTCLOUD_SYNC_INTERVAL=900

CMD /run.sh
