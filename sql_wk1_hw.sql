-- Q1. Which destination in the flights database is the furthest distance away, based on information in the flights table. 
SELECT dest, MAX(distance) FROM flights;

-- A1: IAH

-- Q2a. What are the different numbers of engines in the planes table? 
SELECT DISTINCT(engine) FROM planes;

-- A2a. Turbo-fan, Turbo-et, Reciprocating, 4 Cycle, Turbo-shaft, and Turbo-prop

-- Q2b. For each number of engines, which aircraft have the most number of seats?  
SELECT engine, seats FROM planes
GROUP BY engine
ORDER BY seats DESC;

-- A2b. Turbo-jet

-- Q3. Show the total number of flights
SELECT COUNT(*) FROM flights;

-- A3. There are 336,776 flights in the table

-- Q4. Show the total number of flights by airline (carrier).
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier
;

-- Q5. Show all of the airlines, ordered by number of flights in descending order. 
SELECT carrier, COUNT(*) FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
;

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

