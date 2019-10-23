-- This is a comment in sql code
-- The example uses
-- a WHERE clause to show the population of 'France'. Note that strings
-- (pieces of text that are data) should be in 'single quotes';

-- Modify it to show the population of Germany
SELECT population
FROM world
WHERE name = 'Germany'

-- Checking a list
-- The word IN allows us to check
-- if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Which countries are
-- not too small and not too big? BETWEEN allows range checking
-- (range specified is inclusive of boundary values). The example below shows countries
-- with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries
-- with an area between 200,000 and 250,000. 
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000

-- How
-- to
-- use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros. 
SELECT name
FROM world
WHERE population >= 200000000

-- Give the name
-- and the per capita GDP for those countries
-- with a population of at least 200 million. 
SELECT name, gdp/population
FROM world
WHERE population >= 200000000

Show the name
-- and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. 
SELECT name, population/1000000
from world
WHERE continent = 'South America'

-- Show the name
-- and population for France, Germany, Italy 
SELECT name, population
from world
WHERE name IN ('France','Germany','Italy')


-- Show the countries
-- which have a name that includes the word 'United' 
SELECT name
from world
WHERE name LIKE '%United%'

-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area
from world
WHERE population >= 250000000 OR area > 3000000

-- Exclusive
-- OR
-- (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
SELECT name, population, area
from world
where population >= 250000000
XOR area > 3000000

-- Show the name
-- and population in millions and the GDP in billions for the countries of the continent 'South America'.
-- Use the
-- ROUND function to show the values to two decimal places. 
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
from world
WHERE continent = 'South America'

-- Greece has capital
-- Athens.

-- Each of the strings 'Greece', and 'Athens' has 6 characters.

-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- The capital
-- of Sweden is Stockholm. Both words start
-- with the letter 'S'.
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

--     You can use the function LEFT to isolate the first character.
--     You can use <> as the NOT EQUALS operator.
SELECT name, capital
FROM world

WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital

-- Equatorial Guinea
-- and Dominican Republic have all of the vowels
-- (a e i o u) in the name. They don't count because they have more than one word in the name.

-- Find the country that has all the vowels and no spaces in its name.

--     You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
--     The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
SELECT name
FROM world
WHERE name LIKE '%u%'
    AND name LIKE '%a%'
    AND name LIKE '%o%'
    AND name LIKE '%i%'
    AND name LIKE '%e%'
    AND name NOT LIKE '% %'

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950

-- Show who won
-- the 1962 prize for Literature.
SELECT winner
FROM nobel
WHERE yr = 1962
    AND subject = 'Literature'

-- Show the year
-- and subject that won 'Albert Einstein' his prize. 
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- Give the name
-- of the 'Peace' winners since the year 2000, including 2000. 
SELECT winner
FROM nobel
WHERE subject ='Peace'
    AND yr >= 2000

Show
all details
(yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT *
FROM nobel
WHERE yr <= 1989
    AND yr >= 1980
    AND subject = 'Literature'

--   Show
-- all details of the presidential
-- winners:

-- Theodore Roosevelt
--     Woodrow Wilson
--     Jimmy Carter
--     Barack Obama
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                   'Barack Obama')

-- Show the winners
-- with first name John 
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

-- Show the year, subject,
-- and name of Physics winners for 1980 together
-- with the Chemistry winners for 1984.
SELECT *
FROM nobel
WHERE yr = 1980
    AND subject = 'Physics'
    OR yr = 1984
    And subject ='Chemistry'