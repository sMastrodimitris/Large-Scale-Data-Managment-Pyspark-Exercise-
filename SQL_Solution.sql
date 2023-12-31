CREATE SCHEMA zillow_schema;

CREATE TABLE zillow_schema.estates(prop VARCHAR(100), offer VARCHAR(100), price INTEGER, bead INTEGER, bath FLOAT(24), sqft FLOAT(53));
COPY INTO zillow_schema.estates FROM 'C:/Users/FURIOUS/Desktop/better_zillow.csv ' USING DELIMITERS ',' ;

SELECT * FROM zillow_schema.estates LIMIT 10;

SELECT bead FROM zillow_schema.estates LIMIT 20;

SELECT bath FROM zillow_schema.estates LIMIT 20;

SELECT sqft FROM zillow_schema.estates LIMIT 20;

SELECT prop FROM zillow_schema.estates LIMIT 20;

SELECT offer FROM zillow_schema.estates LIMIT 20;

SELECT * FROM zillow_schema.estates WHERE offer = 'sale' LIMIT 20;

SELECT price FROM zillow_schema.estates LIMIT 20;

SELECT * FROM zillow_schema.estates WHERE offer = 'sale' AND bead <= 10 LIMIT 20;

SELECT * FROM zillow_schema.estates WHERE price >= 100000 AND price <= 20000000 AND offer = 'sale' AND bead <= 10 LIMIT 20;

SELECT * FROM zillow_schema.estates WHERE price >= 100000 AND price <= 20000000 AND offer = 'sale' AND bead <= 10 AND prop = 'house'   LIMIT 20;


SELECT bead, SUM(price)/SUM(sqft) AS price_per_sqft, RANK() OVER(ORDER BY bead) AS bed_rank
FROM zillow_schema.estates
WHERE prop = 'house' 
AND price >= 100000 
AND price <= 20000000 
AND offer = 'sale' 
AND bead <= 10
GROUP BY bead
ORDER BY bead;
