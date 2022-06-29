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
-- 8.One or the other (but not both)
select name,
    population,
    area
from world
where (
        area > 3000000
        and population <= 250000000
    )
    or (
        area <= 3000000
        and population > 250000000
    );
-- 9. Rounding
select name,
    round(population / 1000000, 2),
    round(gdp / 1000000000, 2)
from world
where continent = 'South America';
-- 10. Trillion dollar economies
select name,
    round(gdp / population, -3)
from world
where gdp >= 1000000000000;
-- 11. Name and capital have the same length
SELECT name,
    capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);
-- 12. Matching name and capital
SELECT name,
    capital
FROM world
where LEFT(name, 1) = LEFT(capital, 1)
    and name <> capital;
 -- 13. All the vowels