USE mysql_practice;
SHOW TABLES;
DESCRIBE cities;
DESCRIBE states;
SELECT * FROM cities;
SELECT * FROM states;

-- Get the list of the 3 most populated cities, as well as the name of the associated state.
SELECT name, state_name FROM cities INNER JOIN states ON city_state = state_code ORDER BY population DESC LIMIT 3;

-- Get the list of states whose department number starts with “97”.
SELECT * FROM states WHERE state_code LIKE '97%';
SELECT * FROM states WHERE state_code RLIKE '^97';

/* Get the list of the name of each State, associated with its code and the number of cities within these States, 
by sorting in order to get in priority the States which have the largest number of cities. */
SELECT state_name, state_code, count(*) AS 'Number of cities' FROM states
	INNER JOIN cities ON state_code = city_state GROUP BY city_state ORDER BY COUNT(*) DESC;

-- Get the list of the 3 largest States, in terms of surface area.
SELECT state_name FROM states INNER JOIN cities ON state_code = city_state
	GROUP BY state_code ORDER BY sum(surface) DESC LIMIT 3; 

-- Get the list of cities whose surface is greater than the average surface.
SELECT * FROM cities WHERE surface > (SELECT AVG(surface) FROM cities);

-- Get the list of States with more than 1 million residents.
SELECT state_name, sum(population) AS 'Total Population' FROM states INNER JOIN cities ON state_code = city_state
	GROUP BY state_code HAVING SUM(population) > 1000000;
    
-- Replace the dashes with a blank space, for all cities beginning with “SAN-”
UPDATE cities SET name = REPLACE(name,'-',' ') WHERE cities.name RLIKE '^SAN-';