# CouchDB Github Action

```yaml
name: TEST

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node: [10, 12, 14]
        couchdb: [3.1.0]

    steps:
      - name: Git checkout
        uses: actions/checkout@v2

      - name: Set Node.js version
        uses: actions/setup-node@v1
        with:
          node-version: ${{ matrix.node }}

      - name: Start CouchDB
        uses: iamssen/couchdb-github-action@master
        with:
          couchdb-version: ${{ matrix.couchdb }}
```
