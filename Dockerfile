FROM docker:stable
RUN apk add --no-cache curl
COPY local.ini /opt/couchdb/etc/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]