#!/bin/sh

DB=cz_osm
USER=jethro
PASSWORD=kokoko
FILE=czech-republic-latest.osm.pbf

wget -N "http://download.geofabrik.de/europe/$FILE" 
ogr2ogr -f PostgreSQL "PG:dbname=$DB" $FILE \
    -lco COLUMN_TYPES=other_tags=hstore \
    -overwrite \
    --config OSM_MAX_TMPFILE_SIZE 1024

osmosis --truncate-pgsql database=$DB user=$USER password=$PASSWORD
osmosis --read-pbf $FILE --log-progress --write-pgsql database=$DB user=$USER password=$PASSWORD
