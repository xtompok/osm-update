CREATE INDEX lines_highway ON lines(highway);
CREATE INDEX lines_name ON lines(name);
CREATE INDEX lines_osm_id ON lines(osm_id);
CREATE INDEX ways_name ON ways((tags->'name'));
CREATE INDEX ways_highway ON ways((tags->'highway'));
CREATE INDEX ways_ref ON ways((tags->'ref'));

CREATE INDEX points_osm_id ON points(osm_id);
