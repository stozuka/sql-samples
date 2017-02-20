SELECT id, name, kind, unit_price,
       RANK () OVER (PARTITION BY kind ORDER BY unit_price) AS default,
       DENSE_RANK () OVER (PARTITION BY kind ORDER BY unit_price) AS dense,
       ROW_NUMBER () OVER (PARTITION BY kind ORDER BY unit_price) AS row_number
FROM item;

SELECT id, name, kind, unit_price,
       SUM (unit_price) OVER (PARTITION BY kind ORDER BY id) AS each_kind_sum
  FROM item;

SELECT id, name, kind, unit_price,
       ROUND(
         AVG (unit_price) OVER (ORDER BY id)
       ) AS current_avg
  FROM item;

SELECT id, name, kind, unit_price,
       AVG (unit_price) OVER (ORDER BY id ROWS 2 PRECEDING) AS moving_avg
  FROM item;

SELECT id, name, kind, unit_price,
       AVG (unit_price) OVER (ORDER BY id ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg
  FROM item;
