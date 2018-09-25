#!/bin/sh

wget -N "http://download.geofabrik.de/europe/czech-republic-latest.osm.pbf" 
ogr2ogr -f PostgreSQL "PG:dbname=cz_osm" czech-republic-latest.osm.pbf \
    -lco COLUMN_TYPES=other_tags=hstore \
    -overwrite \
    --config OSM_MAX_TMPFILE_SIZE 1024

osmosis --read-pbf czech-republic-latest.osm.pbf --log-progress --write-pgsql database=cz_osm user=j́ethro password=UBERPASSWORD

