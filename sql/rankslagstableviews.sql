--1. Calculate Growth Metrics Using Window Functions (LAG)--
SELECT 
    countrycode,
    year,
    gdppc,
    -- This looks back 1 row (1 year) within the same country to grab the past GDP
    LAG(gdppc, 1) OVER (PARTITION BY countrycode ORDER BY year) AS previous_gdppc
FROM organized_data;


--2. Rank Countries per Year (RANK or DENSE_RANK)--
SELECT
    countrycode,
    year,
    gdppc,
    rank()over (partition by year order by gdppc desc) as rankcountry
FROM organized_data
where gdppc is not null

--3. Create an Analytical SQL View (CREATE VIEW)--

create view vw_economic_analisys as
select 
    countrycode,
    year,
    gdppc,
    lag(gdppc, 1) over (partition by countrycode order by year) AS previous_gdppc,

    RANK() OVER (PARTITION BY year ORDER BY gdppc DESC) AS rankcountry

FROM organized_data


--4. Analyse vw_economic_analisys

select * 
from vw_economic_analisys
where gdppc is not null

--Alter view
GO
alter view vw_economic_analisys as
select 
    countrycode,
    year,
    gdppc,
    lag(gdppc, 1) over (partition by countrycode order by year) AS previous_gdppc,

    RANK() OVER (PARTITION BY year ORDER BY gdppc DESC) AS rankcountry

FROM organized_data
where gdppc is not null

select * from vw_economic_analisys