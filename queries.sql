SELECT COUNT(part_number)
	FROM part_nyc
	WHERE on_hand > 70;

SELECT ((SELECT COUNT(*) 
	 FROM part_nyc 
	 WHERE color = (SELECT color_id 
			FROM color 
			WHERE color_name = 'Red'))+(SELECT COUNT(*) 
	 					    FROM part_sfo 
	   					    WHERE color =  (SELECT color_id 
	 		 	 		    FROM color 
						    WHERE color_name = 'Red'))) AS Total_parts;
			 
SELECT supplier.supplier_name
	FROM supplier
	INNER JOIN part_nyc ON supplier.supplier_id = part_nyc.supplier
	INNER JOIN part_sfo ON supplier.supplier_id = part_sfo.supplier
	GROUP BY S.supplier_name
	HAVING SUM(part_nyc.on_hand) > SUM(part_sfo.on_hand);
	
	
SELECT supplier.supplier_name 
FROM (SELECT DISTINCT supplier 
      FROM(SELECT part_number 
	   FROM part_nyc except (SELECT part_number 
				 FROM part_sfo))  AS TEMP , part_nyc 
      				 WHERE part_nyc.part_number = TEMP.part_number) AS TEMP2, supplier 
				 WHERE supplier.supplier_id = TEMP2.supplier;

UPDATE part_nyc SET on_hand = -10;

DELETE FROM part_nyc WHERE on_hand < 30;
