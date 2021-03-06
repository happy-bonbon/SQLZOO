-- 1. Total world population
SELECT SUM(population)
FROM world;
-- 2. List of continents
SELECT DISTINCT continent
FROM world;
-- 3. GDP of Africa
SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa';
-- 4. Count the big countries
SELECT count(name)
FROM world
WHERE area >= 1000000;
-- 5. Baltic states population
SELECT sum(population)
FROM world
WHERE name in ('Estonia', 'Latvia', 'Lithuania');
-- 6. Counting the countries of each continent
SELECT continent,
    count(name)
FROM world
GROUP BY continent;
-- 7. Counting big countries in each continent
SELECT continent,
    count(name)
FROM world
WHERE population > 10000000
GROUP BY continent;
-- 8. Counting big continents
SELECT continent
FROM world
GROUP BY continent
HAVING sum(population) > 100000000;