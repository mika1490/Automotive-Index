
DROP DATABASE IF EXISTS indexed_cars;
DROP USER IF EXISTS indexed_cars_user;

-- Create a new postgres user named indexed_cars_user
CREATE USER indexed_cars_user;

-- Create a new database named indexed_cars owned by indexed_cars_user
CREATE DATABASE indexed_cars OWNER indexed_cars_user;

-- Run the provided scripts/car_models.sql script on the indexed_cars database
\c indexed_cars;

\i scripts/car_models.sql;

-- Run the provided scripts/car_model_data.sql script on the indexed_cars database 10 times
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;

-- Create indexes on the columns that would improve query performance.
CREATE INDEX index_of_make_code
ON car_models (make_code);

CREATE INDEX index_of_model_code
ON car_models (model_code);

CREATE INDEX index_of_year
ON car_models (year);

SELECT count(*) FROM car_models;

-- Enable timing queries in Postgres by toggling the \timing command in the psql shell.
\timing

-- Run a query to get a list of all make_title values from the car_models table where the make_code is 'LAM', without any duplicate rows, and note the time somewhere.
SELECT DISTINCT
make_title
FROM car_models WHERE make_code = 'LAM';

-- Time: 21.248 ms

-- Run a query to list all model_title values where the make_code is 'NISSAN', and the model_code is 'GT-R' without any duplicate rows, and note the time somewhere.
SELECT DISTINCT
model_title
FROM car_models WHERE make_code = 'NISSAN'
AND model_code = 'GT-R';

-- Time: 20.892 ms

-- Run a query to list all make_code, model_code, model_title, and year from car_models where the make_code is 'LAM', and note the time somewhere.
SELECT 
make_code, model_code, model_title, year
FROM car_models WHERE make_code = 'LAM';

-- Time: 20.034 ms


-- Run a query to list all fields from all car_models in years between 2010 and 2015, and note the time somewhere
SELECT *
FROM car_models WHERE year BETWEEN 2010 AND 2015;

-- Time: 60.684 ms

-- Run a query to list all fields from all car_models in the year of 2010, and note the time somewhere
SELECT * 
FROM car_models WHERE year = 2010;

-- Time: 26.774 ms

\timing
