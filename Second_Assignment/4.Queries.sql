---- c)
SELECT COUNT(DISTINCT cod) FROM municipalities m
WHERE NOT EXISTS
(SELECT * FROM TABLE(m.facilities) f, TABLE(VALUE(f).activities) a
WHERE a.activity = 'cinema');

---- d)
WITH query1 AS
(SELECT f.municipality.designation as municipality, COUNT(f.name) AS num_facilities, a.activity
FROM facilities f, TABLE(f.activities) a
GROUP BY a.activity, f.municipality.designation),
query2 AS
(SELECT activity, MAX(num_facilities) AS num_facilities
FROM query1 GROUP BY activity)
SELECT  query2.activity, query1.municipality, query2.num_facilities
FROM query1 INNER JOIN query2
ON query1.num_facilities = query2.num_facilities AND query1.activity = query2.activity;
