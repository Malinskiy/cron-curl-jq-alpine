FROM alpine:3.6

MAINTAINER Anton Malinskiy <anton@malinskiy.com>

RUN set -xeo pipefail && \
    mkdir /etc/supervisord.d && \
    apk update && \
    apk add curl ca-certificates supervisor jq dcron bash && \
    rm -r /var/cache/apk/APKINDEX.*

COPY supervisor/supervisord.conf /etc

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
