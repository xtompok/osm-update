--SELECT AddGeometryColumn ('public','points','jtsk_geometry',5514,'POINT',2);
--SELECT AddGeometryColumn ('public','lines','jtsk_geometry',5514,'LINESTRING',2);
--SELECT AddGeometryColumn ('public','multilinestrings','jtsk_geometry',5514,'MULTILINESTRING',2);
--SELECT AddGeometryColumn ('public','multipolygons','jtsk_geometry',5514,'MULTIPOLYGON',2);
--SELECT AddGeometryColumn ('public','other_relations','jtsk_geometry',5514,'GEOMETRYCOLLECTION',2);

--UPDATE points SET jtsk_geometry = ST_Transform(wkb_geometry,5514);
--UPDATE lines SET jtsk_geometry = ST_Transform(wkb_geometry,5514);
--UPDATE multilinestrings SET jtsk_geometry = ST_Transform(wkb_geometry,5514);
--UPDATE multipolygons SET jtsk_geometry = ST_Transform(wkb_geometry,5514);
--UPDATE other_relations SET jtsk_geometry = ST_Transform(wkb_geometry,5514);

CREATE INDEX points_jtsk ON points USING GIST(jtsk_geometry);
CREATE INDEX lines_jtsk ON lines USING GIST(jtsk_geometry);
CREATE INDEX multilinestrings_jtsk ON multilinestrings USING GIST(jtsk_geometry);
CREATE INDEX multipolygons_jtsk ON multipolygons USING GIST(jtsk_geometry);
CREATE INDEX other_relations_jtsk ON other_relations USING GIST(jtsk_geometry);
