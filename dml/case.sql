SELECT id,
       unit_price,
       CASE WHEN unit_price < 1000
            THEN 'CHEAP'
            WHEN 1000 <= unit_price AND unit_price < 2000
            THEN 'MEDIUM'
            WHEN 2000 <= unit_price
            THEN 'EXPENSIVE'
            ELSE 'ELSE'
       END AS unit_price_class
FROM item;

SELECT SUM(
         CASE WHEN kind = 'stationary' THEN unit_price ELSE 0 END
       ) AS stationary,
       SUM(
         CASE WHEN kind = 'clothes' THEN unit_price ELSE 0 END
       ) AS clothes,
       SUM(
         CASE WHEN kind = 'kitchen appliances' THEN unit_price ELSE 0 END
       ) AS kitchen
FROM item;
