#part_ny
DROP INDEX IF EXISTS nyc_part_on_hand_idx;
CREATE INDEX nyc_part_on_hand_idx
ON part_nyc(on_hand);

DROP INDEX IF EXISTS nyc_part_supplier_idx;
CREATE INDEX nyc_part_supplier_idx
ON part_nyc(supplier);



#part_sfo
DROP INDEX IF EXISTS sfo_part_on_hand_idx;
CREATE INDEX sfo_part_on_hand_idx
ON #part_sfo(on_hand);

DROP INDEX IF EXISTS sfo_part_supplier_idx;
CREATE INDEX sfo_part_supplier_idx
ON part_sfo(supplier);
