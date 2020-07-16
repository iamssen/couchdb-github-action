#!/bin/sh

COUCHDB_VERSION=$1

if [[ -z "$COUCHDB_VERSION" ]]; then
  echo "Missing CouchDB version in the [couchdb-version] input. Received value: $COUCHDB_VERSION"
  exit 2
fi

echo "Environments"
echo "- curl : $(which curl)"

echo "Starting CouchDB..."
docker run --name my-couchdb-app -p 5984:5984 -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -d couchdb:$COUCHDB_VERSION
docker ps

function waiting() {
  echo "Waiting for CouchDB run..."

  TIMEOUT=20
  TIMER=$TIMEOUT

  while ! curl -f http://127.0.0.1:5984 &> /dev/null
  do
    sleep 1
    # echo $(curl -o /dev/null -w "%{http_code}" "http://localhost:19764")
    echo $(curl -f http://localhost:5984)
    echo $(curl -f http://0.0.0.0:5984)
    echo $(curl -f http://127.0.0.1:5984)
    echo $(curl -f https://127.0.0.1:5984)
    echo $(docker ps)
    # echo -ne "."

    TIMER=$((TIMER - 1))

    if [[ $TIMER -eq 0 ]]; then
      echo "CouchDB did not run within $TIMEOUT seconds."
      exit 2
    fi
  done
}

waiting
