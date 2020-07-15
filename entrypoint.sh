#!/bin/sh

COUCHDB_VERSION=$1

if [ -z "$COUCHDB_VERSION" ]; then
  echo "Missing CouchDB version in the [couchdb-version] input. Received value: $COUCHDB_VERSION"
  exit 2
fi

echo "Check dependencies"
echo "- curl : $(which curl)"

echo "Starting CouchDB"
docker run -p 5984:19764 -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -d couchdb:$COUCHDB_VERSION

function waiting() {
  echo "Waiting for CouchDB run..."

  while ! curl -f http://localhost:19764 &> /dev/null
  do
    # echo $(curl -o /dev/null -w "%{http_code}" "http://localhost:19764")
    echo $(curl -f http://localhost:19764)
    echo $(docker ps)
    # echo -ne "."
    sleep 5
  done
}

waiting
