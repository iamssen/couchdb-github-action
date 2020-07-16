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
        couchdb: ["3.1", "3.0", "2.3"]

    steps:
      - name: Git checkout
        uses: actions/checkout@v2

      - name: Start CouchDB
        uses: iamssen/couchdb-github-action@master
        with:
          couchdb-version: ${{ matrix.couchdb }}

      - name: Test endpoint
        run: |
          curl -f http://127.0.0.1:5984/

      - name: Test auth
        run: |
          curl -X POST -H "Content-Type: application/json; charset=utf-8" -d '{"name": "admin", "password": "password"}' http://127.0.0.1:5984/_session
```

- endpoint : `http://127.0.0.1:5984`
- auth
  - name : `admin`
  - password : `password`

# Examples

- Github Workflow Sample <https://github.com/iamssen/mongodb-to-couchdb/blob/master/.github/workflows/test.yml#L21>
- Jest Testcase <https://github.com/iamssen/mongodb-to-couchdb/blob/master/src/%40ssen/couchdb/__tests__/couchdb.test.ts>
