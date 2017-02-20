INSERT INTO item_kind (kind, original_price, unit_price)
       SELECT kind, SUM(original_price), SUM(unit_price)
  FROM item
 GROUP BY kind;
