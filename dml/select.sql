SELECT * FROM item;

SELECT id, name, unit_price FROM item;

SELECT id, name, unit_price AS price FROM item;

SELECT id, name, 100 AS const FROM item;

SELECT DISTINCT original_price FROM item;

SELECT *
  FROM item
 WHERE kind = 'stationary';

SELECT unit_price, unit_price * 2 AS doubled, (100 + 200) * 3 AS c FROM item;

SELECT unit_price, original_price, unit_price - original_price AS benefit
  FROM item
 WHERE unit_price - original_price >= 500;

SELECT original_price
  FROM item
 WHERE original_price IS NOT NULL
   AND original_price >= 1000;

SELECT unit_price, original_price
  FROM item
 WHERE original_price >=1000
    OR unit_price >= 1000;

SELECT kind, unit_price, original_price
  FROM item
 WHERE kind = 'kitchen appliances'
   AND (original_price IS NOT NULL AND unit_price IS NOT NULL)
   AND (original_price >=500 OR unit_price >= 500);

SELECT COUNT(*) AS total_count, COUNT(original_price) AS rm_null_in_original_price
 FROM item;

SELECT SUM(original_price) AS original, SUM(unit_price) AS unit FROM item;

SELECT AVG(original_price) AS original, AVG(unit_price) AS unit FROM item;

SELECT kind, COUNT(DISTINCT kind) FROM item GROUP BY kind;

SELECT original_price, COUNT(original_price)
  FROM item
 WHERE original_price IS NOT NULL
 GROUP BY original_price;

SELECT original_price AS original, COUNT(original_price) AS original_count
  FROM item
 WHERE original_price IS NOT NULL
 GROUP BY original_price;

SELECT original_price, COUNT(*)
  FROM item
 WHERE original_price IS NOT NULL
 GROUP BY original_price
HAVING COUNT(*) >= 1;

SELECT *
  FROM item
 WHERE created_at IS NOT NULL
 ORDER BY created_at DESC, unit_price;
