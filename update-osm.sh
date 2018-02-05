#!/bin/sh

wget -N "http://download.geofabrik.de/europe/czech-republic-latest.osm.pbf" 
ogr2ogr -f PostgreSQL "PG:dbname=cz_osm active_schema=ogr" czech-republic-latest.osm.pbf \
    -lco COLUMN_TYPES=other_tags=hstore \
        --config OSM_MAX_TMPFILE_SIZE 1024


