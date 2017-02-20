SELECT kind, SUM(unit_price)
  FROM item
 GROUP BY kind
UNION
SELECT 'total' AS kind, SUM(unit_price)
  FROM item;

SELECT kind, SUM(unit_price) AS sum_unit
  FROM item
 GROUP BY ROLLUP(kind);

SELECT GROUPING(kind) AS kind_id_grouping,
       GROUPING(created_at) AS created_at_is_grouping,
       kind,
       SUM(unit_price)
  FROM item
 GROUP BY ROLLUP(kind, created_at);

SELECT CASE WHEN GROUPING(kind) = 1 THEN 'TOTAL' ELSE kind END AS kind,
       CASE WHEN GROUPING(created_at) = 1 THEN 'TOTAL' ELSE CAST(created_at AS VARCHAR(16)) END AS created_at,
       SUM(unit_price) AS sum
  FROM item
 GROUP BY ROLLUP(kind, created_at);

SELECT CASE WHEN GROUPING(kind) = 1 THEN 'TOTAL' ELSE kind END AS kind,
       CASE WHEN GROUPING(created_at) = 1 THEN 'TOTAL' ELSE CAST(created_at AS VARCHAR(16)) END AS created_at,
       SUM(unit_price) AS sum
  FROM item
 GROUP BY CUBE(kind, created_at);

SELECT CASE WHEN GROUPING(kind) = 1 THEN 'TOTAL' ELSE kind END AS kind,
       CASE WHEN GROUPING(created_at) = 1 THEN 'TOTAL' ELSE CAST(created_at AS VARCHAR(16)) END AS created_at,
       SUM(unit_price) AS sum
  FROM item
 GROUP BY GROUPING SETS(kind, created_at);
