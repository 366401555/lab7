
DROP INDEX IF EXISTS part_nyc_on_hand_idx;
CREATE INDEX part_nyc_on_hand_idx
ON part_nyc(on_hand);

DROP INDEX IF EXISTS part_nyc_supplier_idx;
CREATE INDEX part_nyc_supplier_idx
ON part_nyc(supplier);




DROP INDEX IF EXISTS part_sfo_on_hand_idx;
CREATE INDEX part_sfo_on_hand_idx
ON part_sfo(on_hand);

DROP INDEX IF EXISTS part_sfo_supplier_idx;
CREATE INDEX part_sfo_supplier_idx
ON part_sfo(supplier);
