# CouchDB Github Action

```yaml
name: TEST

on: [push]

jobs:
  build:
    name: Test ${{ matrix.couchdb }}
    runs-on: ubuntu-latest
    strategy:
      matrix:
        couchdb: ["3.1.0", "2.3.1"]

    steps:
      - name: Git checkout
        uses: actions/checkout@v2

      - name: Start CouchDB
        uses: iamssen/couchdb-github-action@master
        with:
          couchdb-version: ${{ matrix.couchdb }}
      - name: Test
        run: curl -sS -f http://127.0.0.1:5984/
```
