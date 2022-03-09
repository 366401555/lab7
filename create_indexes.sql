
DROP INDEX IF EXISTS part_nyc_on_hand_idx;
CREATE INDEX part_nyc_on_hand_idx
ON part_nyc USING BTREE (on_hand);
DROP INDEX IF EXISTS part_sfo_on_hand_idx;
CREATE INDEX part_sfo_on_hand_idx
ON part_sfo USING BTREE (on_hand);


DROP INDEX IF EXISTS part_nyc_supplier_idx;
CREATE INDEX part_nyc_supplier_idx
ON part_nyc USING BTREE (supplier);
DROP INDEX IF EXISTS part_sfo_supplier_idx;
CREATE INDEX part_sfo_supplier_idx
ON part_sfo USING BTREE (supplier);

DROP INDEX IF EXISTS part_nyc_part_number_idx;
CREATE INDEX part_nyc_part_number_idx 
ON part_nyc USING BTREE (part_number);
DROP INDEX IF EXISTS part_sfo_part_number_idx;
CREATE INDEX part_sfo_part_number_idx 
ON part_sfo USING BTREE (part_number);

DROP INDEX IF EXISTS part_nyc_color_idx;
CREATE INDEX part_nyc_color_idx 
ON part_nyc USING BTREE (color);
DROP INDEX IF EXISTS part_sfo_color_idx;
CREATE INDEX part_sfo_color_idx 
ON part_sfo USING BTREE (color);



