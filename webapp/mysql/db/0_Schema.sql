DROP DATABASE IF EXISTS isuumo;

CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;

DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    thumbnail VARCHAR(128) NOT NULL,
    address VARCHAR(128) NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    rent INTEGER NOT NULL,
    door_height INTEGER NOT NULL,
    door_width INTEGER NOT NULL,
    features VARCHAR(64) NOT NULL,
    popularity INTEGER NOT NULL,
    negative_popularity INTEGER AS (- popularity) NOT NULL
);

ALTER TABLE
    isuumo.estate
ADD
    INDEX `idx_rent_id`(rent, id);

ALTER TABLE
    isuumo.estate
ADD
    INDEX `idx_doorwidth_doorheight`(door_width, door_height);

ALTER TABLE
    isuumo.estate
ADD
    INDEX `idx_latitude_longitude`(latitude, longitude);

ALTER TABLE
    isuumo.estate
ADD
    INDEX `idx_popularity_id`(negative_popularity, id);

CREATE TABLE isuumo.chair (
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    thumbnail VARCHAR(128) NOT NULL,
    price INTEGER NOT NULL,
    height INTEGER NOT NULL,
    width INTEGER NOT NULL,
    depth INTEGER NOT NULL,
    color VARCHAR(64) NOT NULL,
    features VARCHAR(64) NOT NULL,
    kind VARCHAR(64) NOT NULL,
    popularity INTEGER NOT NULL,
    stock INTEGER NOT NULL,
    negative_popularity INTEGER AS (- popularity) NOT NULL
);

ALTER TABLE
    isuumo.chair
ADD
    INDEX `idx_price_id`(price, id);

ALTER TABLE
    isuumo.chair
ADD
    INDEX `idx_popularity_id`(negative_popularity, id);
