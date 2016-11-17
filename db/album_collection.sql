DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS collectors;

CREATE TABLE collectors (
id SERIAL8 primary key,
name VARCHAR(255) NOT NULL
);

CREATE TABLE artists  (
id SERIAL8 primary key,
name VARCHAR(255) NOT NULL
);

CREATE TABLE albums  (
id SERIAL8 primary key,
title VARCHAR(255),
genre VARCHAR(255),
collector_id INT8 references collectors(id),
artist_id INT8 references artists(id)
);



