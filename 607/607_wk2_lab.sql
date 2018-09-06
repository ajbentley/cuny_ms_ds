DROP TABLE IF EXISTS movie_ratings;

CREATE TABLE movie_ratings (
    id INT NOT NULL,
    Respondant_Name VARCHAR(255) NOT NULL,
    First_Purge TINYINT,
    Isle_of_Dogs TINYINT,
    Christopher_Robin TINYINT,
    Skyscraper TINYINT,
    Blockers TINYINT,
    Quiet_Place TINYINT,
    Gender VARCHAR(6),
    Age VARCHAR(12),
    US_Region VARCHAR(255),
    PRIMARY KEY (id)
);

LOAD DATA LOCAL INFILE 'C:/Users/joshua.bentley/Dropbox/cuny_msds/607/week2/movie_ratings.csv'
INTO TABLE movie_ratings
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
;

SELECT * FROM movie_ratings;

SELECT 
AVG(First_Purge), 
AVG(Isle_of_Dogs),
AVG(Christopher_Robin),
AVG(Skyscraper),
AVG(Blockers),
AVG(Quiet_Place)
 FROM movie_ratings;
 
SELECT Gender, COUNT(Gender) FROM movie_ratings
GROUP BY Gender
 ;

SELECT AVG(First_Purge), 
AVG(Isle_of_Dogs),
AVG(Christopher_Robin),
AVG(Skyscraper),
AVG(Blockers),
AVG(Quiet_Place)
FROM movie_ratings
WHERE Gender = 'Female';

SELECT
    AVG(First_Purge), 
    (SELECT AVG (First_Purge) FROM movie_ratings WHERE Gender = 'Female') FEM_AVG_First_Purge,   
    (SELECT AVG(First_Purge) FROM movie_ratings ) - (SELECT AVG(First_Purge) FROM movie_ratings WHERE Gender = 'Female') AS First_Purge_Diff
    FROM movie_ratings;
