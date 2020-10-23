ALTER TABLE ways ADD COLUMN ref_array text[];

UPDATE ways SET ref_array = string_to_array(tags->'ref',';');  

CREATE INDEX idx_ways_ref_array ON ways USING GIN(ref_array);
