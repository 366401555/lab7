SELECT COUNT(part_number)
	FROM part_nyc
	WHERE on_hand > 70;

SELECT ((SELECT COUNT(*) 
	 FROM part_nyc 
	 WHERE color = (SELECT color_id 
			FROM color WHERE color_name = 'Red')) + (SELECT COUNT(*) 
								FROM part_sfo 
								WHERE color =  (SELECT color_id 
										FROM color 
										WHERE color_name = 'Red'))) AS total;
SELECT supplier.supplier_name 
	FROM supplier, (SELECT DISTINCT t1.supplier 
					      FROM (SELECT DISTINCT supplier , SUM(on_hand) as total 
						    FROM part_nyc GROUP BY supplier) AS t1, (SELECT DISTINCT supplier , SUM(on_hand) as total 
											     from part_sfo 
											     group by supplier) as t2 
											     where t1.total > t2.total and t1.supplier = t2.supplier) as idid 
											     where idid.supplier = supplier.supplier_id;
select supplier.supplier_name 
from (select distinct supplier 
      from(select part_number 
	   from part_nyc except (select part_number 
				 from part_sfo))  as a , part_nyc 
      				 where part_nyc.part_number = a.part_number) as id, supplier 
				 where supplier.supplier_id = id.supplier;

UPDATE part_nyc SET on_hand = -10;

DELETE FROM part_nyc WHERE on_hand < 30;
