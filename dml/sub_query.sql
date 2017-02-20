SELECT kind, original_price_sum, unit_price_sum
FROM (
  SELECT kind, SUM(original_price) AS original_price_sum, SUM(unit_price) AS unit_price_sum
    FROM item
   GROUP BY kind
) AS item_sum;

SELECT *
FROM item
WHERE original_price > (SELECT AVG(original_price) FROM item);

SELECT name, original_price, (SELECT AVG(original_price) FROM item)
FROM item
WHERE original_price IS NOT NULL;

SELECT kind,
       AVG(original_price) AS avg_original,
       (SELECT AVG(original_price) FROM item) AS avg
  FROM item
 GROUP BY kind
HAVING AVG(original_price) >= (SELECT AVG(original_price) FROM item);

SELECT kind,
       name,
       unit_price,
       ROUND(
         (SELECT AVG(unit_price)
          FROM item AS I3
         WHERE I1.kind = I3.kind
         GROUP BY kind),
         2
       )
FROM item AS I1
WHERE unit_price >= (SELECT AVG(unit_price)
                       FROM item AS I2
                      WHERE I1.kind = I2.kind
                      GROUP BY I2.kind
                    );
