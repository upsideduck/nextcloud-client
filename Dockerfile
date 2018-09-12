FROM alpine:latest
MAINTAINER ZzenlD

# Default-Werte setzen
ENV NEXTCLOUD_SYNC_INTERVAL=900

# Installation bash und nextcloud-client
RUN apk add --no-cache bash nextcloud-client

# Verzeichnis anlegen
RUN mkdir /nextcloud

# Skript hinzufügen
ADD run.sh /run.sh

CMD /run.sh
