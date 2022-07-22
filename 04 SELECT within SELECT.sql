-- 1. Bigger than Russia
SELECT name
FROM world
WHERE population > (
        SELECT population
        FROM world
        WHERE name = 'Russia'
    );
-- 2. Richer than UK
SELECT name
FROM world
WHERE continent = 'Europe'
    and gdp / population > (
        SELECT gdp / population
        FROM world
        WHERE name = 'United Kingdom'
    );
-- 3. Neighbours of Argentina and Australia
SELECT name,
    continent
FROM world
WHERE continent in (
        SELECT continent
        FROM world
        WHERE name = 'Argentina'
            or name = 'Australia'
    )
ORDER BY name;
-- 4. Between Canada and Poland
SELECT name,
    population
FROM world
WHERE population > (
        SELECT population
        FROM world
        WHERE name = 'United Kingdom'
    )
    and population < (
        SELECT population
        FROM world
        WHERE name = 'Germany'
    );
-- 5. Percentages of Germany
SELECT name,
    concat(
        round(
            100 * population /(
                SELECT population
                FROM world
                WHERE name = 'Germany'
            ),
            0
        ),
        '%'
    ) AS percentage
FROM world
WHERE continent = 'Europe';
-- 6. Bigger than every country in Europe
SELECT name
FROM world
WHERE gdp > ALL(
        SELECT gdp
        FROM world
        WHERE continent = 'Europe'
            and gdp > 0
    );
-- 7. Largest in each continent
SELECT continent,
    name,
    area
FROM world x
WHERE area >= ALL (
        SELECT area
        FROM world y
        WHERE x.continent = y.continent
            AND area > 0
    );
-- 8. First country of each continent (alphabetically)
SELECT continent,
    name
FROM world x
WHERE name <= ALL (
        SELECT name
        FROM world y
        WHERE x.continent = y.continent
    );
-- 9. Find the continents where all countries have a population <= 25000000.
SELECT name,
    continent,
    population
FROM world x
WHERE 25000000 > ALL (
        SELECT population
        FROM world y
        WHERE x.continent = y.continent
            and population > 0
    );
-- 10. Three time bigger
SELECT name,
    continent
FROM world x
WHERE population >= ALL (
        SELECT population * 3
        FROM world y
        WHERE x.continent = y.continent
            and population > 0
            and x.name <> y.name
    );