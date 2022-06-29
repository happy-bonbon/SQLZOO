-- 1. Introduction
SELECT name,
    continent,
    population
FROM world;
-- 2. Large Countries
SELECT name
FROM world
WHERE population >= 200000000;
-- 3. Per capita GDP
select name,
    GDP / population
from world
where population >= 200000000;
-- 4. South America In millions
select name,
    population / 1000000
from world
where continent = 'South America';
-- 5. France, Germany, Italy
select name,
    population
from world
where name in ('France', 'Germany', 'Italy');
-- 6. United
select name
from world
where name like 'United%';
-- 7. Two ways to be big
select name,
    population,
    area
from world
where area >= 3000000
    or population >= 250000000;