SELECT name, kind, name || kind AS name_kind, LENGTH(name || kind) AS total_len
  FROM item;

SELECT name, UPPER(name), LOWER(name)
  FROM item;

SELECT CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP
  FROM item;

SELECT EXTRACT(YEAR FROM CURRENT_DATE) AS year,
       EXTRACT(MONTH FROM CURRENT_DATE) AS month,
       EXTRACT(DAY FROM CURRENT_DATE) AS day,
       EXTRACT(HOUR FROM CURRENT_TIME) AS hour,
       EXTRACT(MINUTE FROM CURRENT_TIME) AS minute,
       EXTRACT(SECOND FROM CURRENT_TIME) AS second
  FROM item;

SELECT id, CAST(id AS VARCHAR) AS id_str
  FROM item;

SELECT '2017-01-01' AS str_type, CAST('2017-01-01' AS DATE) AS date_type
  FROM item;

SELECT COALESCE(original_price, 0)
  FROM item;
