DROP INDEX IF EXISTS nyc_part_on_hand_idx;
CREATE INDEX nyc_part_on_hand_idx
ON part_nyc(on_hand);
