# docker-osm2pgsql

> Note: This is a fork of https://github.com/openfirmware/docker-osm2pgsql that has been updated to use a newer base image and install a newer version of osm2pgsql

A Docker image with [osm2pgsql](https://github.com/openstreetmap/osm2pgsql), the tool for importing OpenStreetMap data into a Postgresql database. Intended to be used with [openfirmware/docker-postgres-osm](https://github.com/openfirmware/docker-postgres-osm).

## Build Instructions

Can be built from the Dockerfile:

```
docker build --build-arg OSM2PGSQL_VERSION=1.3.0 -t geocodio/osm2pgsql github.com/Geocodio/docker-osm2pgsql.git
```

## Running osm2pgsql

Once the image is built, you can run a single-use container with osm2pgsql. Args will be passed to bash, so you will have access to environment variables in your run command.

```
docker run -i -t --rm geocodio/osm2pgsql -c 'osm2pgsql -h'
```

When used with a postgres-osm container, it can import data directly into the database:

```
docker run -i -t --rm --link postgres-osm:pg -v ~/osm:/osm geocodio/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 --database $PG_ENV_OSM_DB --username $PG_ENV_OSM_USER --host pg --port $PG_PORT_5432_TCP_PORT /osm/extract.osm.pbf'
```

For more information on running an import, please see TUTORIAL.markdown. If you have a particular scenario in mind, contact me and I will try to create a guide for that situation.

## Todo

## About

This Dockerfile was built with information from the [Ubuntu 14.04 Switch2OSM guide](http://switch2osm.org/serving-tiles/manually-building-a-tile-server-14-04/).

## Related Docker Images

* [Postgres-OSM Image](https://github.com/openfirmware/docker-postgres-osm)
* [Postgres Image](https://registry.hub.docker.com/_/postgres/)
* [Postgres Image Repo](https://github.com/docker-library/postgres)

