DROP TABLE IF EXISTS item;

CREATE TABLE IF NOT EXISTS item
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  kind VARCHAR(32) NOT NULL,
  unit_price INT DEFAULT 0,
  original_price INT DEFAULT 0,
  created_at DATE
);

ALTER TABLE item ADD COLUMN add_col VARCHAR(100);

ALTER TABLE item DROP COLUMN add_col;

ALTER TABLE item ALTER COLUMN created_at TYPE VARCHAR(100);

ALTER TABLE item ALTER COLUMN created_at TYPE DATE using (created_at::text::date);

BEGIN TRANSACTION;

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES ('T-shirt', 'clothes', 1000, 500, '2009-09-20');

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES ('Hole punch', 'stationary', 500, 320, '2009-09-1');

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES ('Shirt', 'clothes', 4000, 2800, NULL);

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES ('Knife', 'kitchen appliances', 3000, 2800, '2009-09-20');

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES('Bowl', 'kitchen appliances', 6800, 5000, '2009-01-15');

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES ('Folk', 'kitchen appliances', 500, NULL, '2009-09-20');

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES ('Grater', 'kitchen appliances', 880, 790, '2008-04-28');

INSERT INTO item (name, kind, unit_price, original_price, created_at)
VALUES ('Pen', 'stationary', 100, NULL, '2009-11-11');

COMMIT;

ALTER TABLE item RENAME TO item_rename;

ALTER TABLE item_rename RENAME TO item;

DROP TABLE IF EXISTS address;

CREATE TABLE IF NOT EXISTS address (
  register_id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  addr VARCHAR(256) NOT NULL,
  tel CHAR(10),
  email VARCHAR(100)
);

ALTER TABLE address ADD COLUMN postal_code CHAR(8) NOT NULL;

DROP TABLE IF EXISTS item_kind;

CREATE TABLE IF NOT EXISTS item_kind (
  id SERIAL PRIMARY KEY,
  kind VARCHAR(100) NOT NULL,
  unit_price INT NOT NULL,
  original_price INT NOT NULL
);

DROP TABLE IF EXISTS store;

CREATE TABLE IF NOT EXISTS store
(
  id SERIAL PRIMARY KEY,
  store_name VARCHAR(100),
  item_id INT NOT NULL REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE
);

BEGIN TRANSACTION;

INSERT INTO store (store_name, item_id)
VALUES ('Tokyo branch', 1);

INSERT INTO store (store_name, item_id)
VALUES ('Osaka branch', 2);

COMMIT;
