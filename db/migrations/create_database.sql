CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
\c makersbnb
CREATE TABLE Users (id SERIAL PRIMARY KEY, first_name VARCHAR(60), last_name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));
