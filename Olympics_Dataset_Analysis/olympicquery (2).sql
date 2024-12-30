-- Using the Olympics dataset
USE olympicsdataset;

-- Query to get all the data:
SELECT * FROM olympics;

-- Finding the name and medals from the table:
SELECT name, medal FROM olympics;

-- Count the distinct name from table:
SELECT COUNT(DISTINCT name) AS Total_Athletes FROM olympics;

-- Finding all rows where the medal is gold from olympics:
SELECT * FROM olympics WHERE medal = 'Gold';

-- Finding name, year, medal where medal is Silver: 
SELECT name, year, medal FROM olympics WHERE medal = 'Silver' ORDER BY year;

-- count the number of gold, silver and bronze medal won as a team from olympics: 
SELECT team, 
       COUNT(CASE WHEN medal = 'Gold' THEN 1 END) AS Gold_Medals,
       COUNT(CASE WHEN medal = 'Silver' THEN 1 END) AS Silver_Medals,
       COUNT(CASE WHEN medal = 'Bronze' THEN 1 END) AS Bronze_Medals
FROM olympics
GROUP BY team;

-- Find all the rows from the olympics where the team have won gold more than 50: 
SELECT team 
FROM olympics
WHERE medal = 'Gold'
GROUP BY team
HAVING COUNT(*) > 50;

-- Find the name of the player who won most of the medals: 
SELECT name, COUNT(*) AS Total_Medals
FROM olympics
GROUP BY name
ORDER BY Total_Medals DESC
LIMIT 1;

-- Find all the different events of freestyle: 
SELECT DISTINCT event
FROM olympics
WHERE event LIKE '%Freestyle%';

-- Find the top 3 players and sports won most of the medals: 
SELECT sport, name, COUNT(*) AS Total_Medals
FROM olympics
GROUP BY sport, name
ORDER BY Total_Medals DESC
LIMIT 3;

-- Find the name and in which year they have won more than 1 medal: 
SELECT name, year, COUNT(*) AS Total_Medals
FROM olympics
GROUP BY name, year
HAVING COUNT(*) > 1;

-- Find the team where medal is gold counting of which in different season greater than 1: 
SELECT team
FROM olympics
WHERE medal = 'Gold'
GROUP BY team
HAVING COUNT(DISTINCT season) > 1;

-- Find the team with most year difference: 
SELECT team, MAX(year) - MIN(year) AS Year_Difference
FROM olympics
GROUP BY team;

-- Find the team and their average medals: 
SELECT team, AVG(Total_Medals) AS Avg_Medals_Per_Athlete
FROM (SELECT team, name, COUNT(*) AS Total_Medals
      FROM olympics
      GROUP BY team, name) AS Subquery
GROUP BY team;

-- Determine different names and events where medal is silver and gold: 
SELECT DISTINCT name, event
FROM olympics
WHERE medal = 'Silver'
  AND event IN (SELECT event
                FROM olympics
                WHERE medal = 'Gold');

-- Find the team which have participated in different sports and count greater than 10: 
SELECT team
FROM olympics
GROUP BY team
HAVING COUNT(DISTINCT sport) > 10;