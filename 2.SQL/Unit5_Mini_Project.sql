CREATE TABLE reviewers (reviewer_id SERIAL PRIMARY KEY,
					   username VARCHAR(20),
					   rating NUMERIC CHECK (rating > 0 and rating <= 5),
					   review VARCHAR (255),
					   video_id INTEGER)

CREATE TABLE videos (video_id SERIAL PRIMARY KEY,
					 title VARCHAR(100) NOT NULL,
					 length INTERVAL NOT NULL,
					 url VARCHAR(255) NOT NULL)
					 
ALTER TABLE reviewers 
ADD CONSTRAINT video_id
FOREIGN KEY (video_id)
REFERENCES videos (video_id)

INSERT INTO videos (title, length, url)
VALUES ('hello world', '00:01:55', 'https://youtu.be/Yw6u6YkTgQ4'),
('cute otters bathing HD', '00:00:38', 'https://youtu.be/nXj9XHuX5pY'),
('hammie boye v2 - new and improved', '00:00:26', 'https://youtu.be/H0Yirlo6WSU'),
('chicken wing song', '10:00:00','https://youtu.be/4tjqrQRLGxg');

INSERT INTO reviewers (username, review, video_id)
VALUES ('fuzzybunny', 'this is me coding', 3),
('marshmallowfellow', 'a classic', '1'),
('terryberry', 'cute aggression', '2'),
('boloneymacaroni', 'chilling with my homies!!', 4),
('mewthree', 'my happy song', '4')

-- note: (above) values for video_id does not need to be with quotations for the code to work.
-- 		 (below) it's the same for rating.

UPDATE reviewers
SET rating = '4.9999'

SELECT * FROM videos 
INNER JOIN reviewers ON videos.video_id = reviewers.video_id
ORDER BY reviewers.video_id ASC
