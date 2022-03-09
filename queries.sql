SELECT COUNT(part_number)
	FROM part_nyc
	WHERE on_hand > 70;

SELECT SUM((SELECT COUNT(part_nyc.on_hand) 
	 FROM part_nyc, color
	 WHERE part_nyc.color = color.color_id AND color.color_name = 'Red') 
	 + 
	 (SELECT COUNT(part_sfo.on_hand)
	FROM part_sfo, color
	WHERE part_sfo.color = color.color_id AND color.color_name = 'Red'));
			 
SELECT supplier.supplier_name 
FROM supplier
WHERE
(SELECT SUM(part_nyc.on_hand)
FROM part_nyc
WHERE part_nyc.supplier = supplier.supplier_id)
>
(SELECT SUM(part_sfo.on_hand)
FROM part_sfo
WHERE part_sfo.supplier = supplier.supplier_id)
GROUP BY supplier.supplier_name;
	
	
SELECT supplier.supplier_name 
FROM (SELECT DISTINCT supplier 
      FROM (SELECT part_number 
	    FROM part_nyc 
	    EXCEPT (SELECT part_number 
		    FROM part_sfo))  AS TEMP , part_nyc 
      		    WHERE part_nyc.part_number = TEMP.part_number) AS TEMP2, supplier 
		    WHERE supplier.supplier_id = TEMP2.supplier;

UPDATE part_nyc SET on_hand = -10;

DELETE FROM part_nyc WHERE on_hand < 30;
