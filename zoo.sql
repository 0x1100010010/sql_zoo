-- https://sqlzoo.net/wiki/SELECT_basics
SELECT population FROM world WHERE name = 'Germany'
SELECT name, population FROM world WHERE name IN ('Sweden','Norway', 'Denmark');
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000


-- https://sqlzoo.net/wiki/SELECT_names
SELECT name FROM world WHERE name LIKE 'Y%'
SELECT name FROM world WHERE name LIKE '%y'
SELECT name FROM world WHERE name LIKE '%X%'
SELECT name FROM world WHERE name LIKE '%land'
SELECT name FROM world WHERE name LIKE 'C%ia'
SELECT name FROM world WHERE name LIKE '%oo%'
SELECT name FROM world WHERE name LIKE '%a%a%a%'
SELECT name FROM world WHERE name LIKE '_t%' ORDER BY name
SELECT name FROM world WHERE name LIKE '%o__o%'
SELECT name FROM world WHERE name LIKE '____'
SELECT name FROM world WHERE capital = Concat(name, ' City')
SELECT capital, name FROM world WHERE capital LIKE concat('%', name, '%')
SELECT name, mid(capital,LENGTH(name)+1) ext FROM world WHERE capital LIKE concat(name,'_%')


-- https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
SELECT name, continent, population FROM world
SELECT name FROM world WHERE population>200000000
SELECT name, gdp/population FROM world WHERE population > 200000000
SELECT name, population/1000000 FROM world WHERE continent = 'South America'
SELECT name, population FROM world WHERE name IN ('France', 'Germany', 'Italy')
SELECT name FROM world WHERE name LIKE '%United%'
SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000
SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world WHERE continent = 'South America'
SELECT name, ROUND(gdp/population,-3) FROM world WHERE gdp>1000000000000
SELECT name, capital FROM world WHERE LENGTH(name) = Length(capital)
SELECT name, capital FROM world WHERE LEFT(name,1) = LEFT(capital,1) AND name != capital
SELECT name FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %'