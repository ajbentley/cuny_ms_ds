DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Reviewers;

CREATE TABLE Videos(vid_id real NOT NULL, title TEXT, length FLOAT(20,2) NOT NULL, url TEXT, primary key (vid_id));
CREATE TABLE Reviewers(rev_id real NOT NULL, vid_id TEXT, reviewer text, rating INT(5) UNSIGNED NULL, review text, 
primary key(rev_id));

INSERT INTO Videos(vid_id, title, length, url) 
VALUES 
(1, 'Proper Opossum Pedicure', 5.5, 'https://youtu.be/1MRE2K3x-AY'),
(2, 'How to Toilet Train Your Cat', 5, 'https://youtu.be/p943wK0tSWQ'),
(3, 'How To Fold A T-shirt In 2 Seconds: Explained', 2.25, 'https://youtu.be/An0mFZ3enhM')
;

INSERT INTO Reviewers(rev_id, vid_id, reviewer, rating, review)
values
(1, 1, "Pogo", 5, "We have met our cuticle and it is us"),
(2, 1, "Crash", 3, "It left me cold"),
(3, 2, "Garfield", 5, "Sounds better than waiting for Jon to clean my box"),
(4, 2, "Bill", 3, "THBBTFT!"),
(5, 3, "Mr. T", 5, "I pity the fool who takes longer to fold!"),
(6, 3, "Mrs. T", 3, "How can you tell if there's a tomato juice stain?");


SELECT * FROM Videos
JOIN Reviewers ON Videos.vid_id = Reviewers.vid_id;