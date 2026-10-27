-- 1. Drop the table to start fresh
DROP TABLE IF EXISTS organized_data;

-- 2. Create the clean table with NOT NULL and Primary Key defined immediately
CREATE TABLE organized_data (
    countrycode CHAR(3) NOT NULL,
    country VARCHAR(50),
    region VARCHAR(50),
    year INT NOT NULL,
    gdppc DECIMAL(18, 6),
    population INT,
    CONSTRAINT PK_organized_data PRIMARY KEY (countrycode, year)
);

-- 3. Insert and cast the data from your raw table
INSERT INTO organized_data (countrycode, country, region, year, gdppc, population)
SELECT 
    countrycode, 
    country, 
    region, 
    CAST(year AS INT), 
    CAST(gdppc AS DECIMAL(18, 6)),
    CAST(pop AS INT)
FROM data_cleaning;

-- 4. Verify your final production-ready table
SELECT TOP 10 * FROM organized_data;