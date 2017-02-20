SELECT id
  FROM item
 UNION
SELECT item_id
  FROM store;

SELECT id
  FROM item
EXCEPT
SELECT item_id
  FROM store;

SELECT item_id
  FROM store
EXCEPT
SELECT id
  FROM item;

SELECT I.id, I.name, I.kind, S.store_name
FROM item AS I INNER JOIN store AS S ON I.id = S.item_id;

SELECT I.id, I.name, I.kind, S.store_name
FROM item AS I LEFT OUTER JOIN store AS S ON I.id = S.item_id;

SELECT * FROM item CROSS JOIN store;
