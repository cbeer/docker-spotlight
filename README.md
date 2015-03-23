# docker-spotlight

## Running with docker-compose

```
$ docker-compose up
```

## Running as docker

`docker-spotlight` expects:

- a solrcloud server with a collection
- a (postgres) database server

It also uses these env variables:
  - SOLR_URL=http://url/to/solr/collection (or:)
  - COLLECTION_NAME=spotlight (default; if not using SOLR_URL, and using a `solr` link)
  - DATABASE_URL=postgres://some:postgres@host/database (if not using a `db` link)
  - SECRET_KEY_BASE=xyz (required)

```
$ docker run -p 8000:80 -e SECRET_KEY_BASE=xyz --link postgres:db --link cbeer/docker-solr-cloud:solr cbeer/docker-spotlight
```