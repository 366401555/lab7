SELECT Count(part_number) AS PartCount
	FROM part_nyc
	WHERE on_hand > 70;

SELECT Count(part_number) AS PartCount
	FROM part_nyc
	WHERE on_hand < 70;

UPDATE part_nyc SET on_hand = -10;

DELETE FROM part_nyc WHERE on_hand < 30;
