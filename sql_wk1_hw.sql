
-- Q1. Which destination in the flights database is the furthest distance away, based on information in the flights table. 
SELECT origin, dest, MAX(distance) FROM flights;

/*A1: The longest distance for a flight according to the data was 4,983 miles, though this was a flight from Newark to George Bush Intercontinental/Houstaon Airport (AIH), which
just doesn't make sense since the two airports are only 1,627 miles away from each other. That being the case I revisited the code and came up with the below, JFK to Honolulu (with
the same mileage, which made much more sense.*/

SELECT origin, dest, distance FROM flights
ORDER BY distance DESC
LIMIT 1;


-- Q2a. What are the different numbers of engines in the planes table? 
SELECT COUNT(*) FROM planes;

-- A2a. Turbo-fan, Turbo-et, Reciprocating, 4 Cycle, Turbo-shaft, and Turbo-prop

-- Q2b. For each number of engines, which aircraft have the most number of seats?  
SELECT engine, seats FROM planes
GROUP BY engine
# HAVING engine = "Turbo-prop" ## used this code to make sure I wasn't having a similar problem as in Q1.
ORDER BY seats DESC;

-- A2b. Turbo-jet

-- Q3. Show the total number of flights
SELECT COUNT(*) FROM flights;

-- A3. There are 336,776 flights in the table

-- Q4. Show the total number of flights by airline (carrier).
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier
;
-- A4. Please run and see below (in other words please don't make me type this all out!)

-- Q5. Show all of the airlines, ordered by number of flights in descending order. 
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
;
-- A5. Please see A4

-- Q6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5
;

-- Q7. Same as Q6 but only for flights with distance 1,000 miles or greater
SELECT carrier, distance, COUNT(*) FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5
;

-- Q8. Free swim: What are the 5 airlines that have the most delays between 6am and 6pm
select carrier, arr_delay from flights
WHERE arr_delay > 0
AND hour BETWEEN 6 and 18
GROUP BY carrier
ORDER BY arr_delay DESC
LIMIT 5
;
-- A8. SkyWest (OO) had 107 flights with arrival delays between 6am-6pm (107) followed by MESA (YV) with 75, Southwest (WN) and American with 33 each,
-- and Frontier (F9) with 32

