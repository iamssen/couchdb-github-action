FROM docker:stable
RUN apk add --no-cache curl
COPY couchdb.ini /opt/couchdb/etc/local.ini
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]