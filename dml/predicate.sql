SELECT name, kind FROM item WHERE name LIKE '%lk%';

SELECT name, kind FROM item WHERE name LIKE '__n';

SELECT unit_price FROM item WHERE unit_price BETWEEN 100 AND 1000;

SELECT unit_price FROM item WHERE unit_price IN (100, 500);

SELECT unit_price
  FROM item
 WHERE unit_price IN (SELECT unit_price FROM item WHERE unit_price >= 500);

SELECT *
  FROM item AS I
 WHERE EXISTS (SELECT * FROM store AS S WHERE I.id = S.item_id);

SELECT *
  FROM item AS I
 WHERE NOT EXISTS (SELECT * FROM store AS S WHERE I.id = S.item_id);
