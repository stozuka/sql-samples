DROP VIEW IF EXISTS item_sum;

CREATE VIEW item_sum (kind, original_price_sum, unit_price_sum)
AS
SELECT kind, SUM(original_price), SUM(unit_price)
  FROM item
 GROUP BY kind;
