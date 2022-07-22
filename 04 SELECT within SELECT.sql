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
