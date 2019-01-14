FROM alpine:latest
MAINTAINER Upsideduck

ARG USER=ncsync
ARG PUID=1000
ARG PGID=1000

ENV NEXTCLOUD_SYNC_INTERVAL=900
ENV USER=$USER \
    PUID=$PUID \
    PGID=$PGID 

# create group and user
RUN addgroup -g $PGID $USER && adduser -G $USER -D -u $PUID $USER


RUN apk add --no-cache nextcloud-client && \
    mkdir nextcloud

COPY run.sh /run.sh
COPY exclude.lst /exclude.lst

CMD /run.sh
