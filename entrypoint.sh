#!/bin/sh

COUCHDB_VERSION=$1

if [ -z "$COUCHDB_VERSION" ]; then
  echo "Missing CouchDB version in the [couchdb-version] input. Received value: $COUCHDB_VERSION"
  exit 2
fi

echo "Starting CouchDB"
docker run -detach --name couchdb --publish 5984:5984 --env COUCHDB_USER=admin --env COUCHDB_PASSWORD:password couchdb:$COUCHDB_VERSION

function waiting() {
  echo "Waiting for CouchDB run..."

  while ! curl -f http://localhost:5984 &> /dev/null
  do
    echo -ne "."
    sleep 1
  done
}

waiting
