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


-- https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
SELECT yr, subject, winner FROM nobel WHERE yr = 1950
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'
SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000
SELECT * FROM nobel WHERE subject = 'Literature' AND yr >= 1980 AND yr <=1989
SELECT * FROM nobel WHERE  winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')
SELECT winner FROM nobel WHERE winner LIKE 'John %'
SELECT * FROM nobel WHERE subject = 'Physics' AND yr = 1980 OR subject = 'Chemistry' AND yr = 1984
SELECT * FROM nobel WHERE yr=1980 AND subject NOT IN ('Chemistry','Medicine')
SELECT * FROM nobel WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)
SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG'
SELECT * FROM nobel WHERE winner = 'EUGENE O\'NEILL''
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner
SELECT winner, subject FROM nobel WHERE yr=1984 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner


-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')
SELECT name FROM world WHERE continent='Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom')
SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name
SELECT name, population FROM world WHERE population BETWEEN (SELECT population+1 FROM world WHERE name = 'Canada') AND (SELECT population-1 FROM world WHERE name = 'Poland')
SELECT name, CONCAT(ROUND((population/(SELECT population FROM world WHERE name='Germany'))*100), '%') FROM world WHERE continent = 'Europe'
SELECT name FROM world WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL)
SELECT continent, name, area FROM world i
  WHERE area >= ALL
    (SELECT area FROM world j
        WHERE j.continent=i.continent
          AND area>0)
SELECT continent,name FROM world i
  WHERE i.name <= ALL (
    SELECT name FROM world j
     WHERE i.continent=j.continent)
SELECT name,continent,population FROM world x
  WHERE 25000000 >= ALL (
    SELECT population FROM world y
     WHERE x.continent=y.continent
       AND y.population>0)
SELECT name,continent FROM world i
  WHERE population > ALL ( SELECT population*3 FROM world j
     WHERE i.continent=j.continent
       AND i.name != j.name
       AND j.population>0)

-- https://sqlzoo.net/wiki/SUM_and_COUNT
SELECT SUM(population) FROM world
SELECT DISTINCT(continent) FROM world
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'
SELECT COUNT(area) FROM world WHERE area >= 1000000
SELECT sum(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
SELECT continent, COUNT(name) FROM world GROUP BY(continent)
SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY(continent) 
SELECT continent FROM world GROUP BY(continent) HAVING SUM(population) >= 100000000
