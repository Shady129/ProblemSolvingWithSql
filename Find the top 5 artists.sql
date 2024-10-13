
--find the top 5 artists whose songs have appeared most frequently in
--the Top 10 of the global music charts. We’ll be
--using three tables: artists, songs, and global_song_rank.

--Table: artists 

--CREATE TABLE artists (
--    artist_id INT PRIMARY KEY,
--    artist_name VARCHAR(100),
--    label_owner VARCHAR(100)
--);

--INSERT INTO artists (artist_id, artist_name, label_owner) VALUES
--(101, 'Ed Sheeran', 'Warner Music Group'),
--(120, 'Drake', 'Warner Music Group'),
--(125, 'Bad Bunny', 'Rimas Entertainment'),
--(130, 'Lady Gaga', 'Interscope Records'),
--(140, 'Katy Perry', 'Capitol Records');

--Table : songs 

--CREATE TABLE songs (
--    song_id INT PRIMARY KEY,
--    artist_id INT,
--    name VARCHAR(100)
--);

--INSERT INTO songs (song_id, artist_id, name) VALUES
--(55511, 101, 'Perfect'),
--(45202, 101, 'Shape of You'),
--(22222, 120, 'One Dance'),
--(19960, 120, 'Hotline Bling'),
--(33333, 125, 'Dakiti'),
--(44444, 125, 'Yonaguni'),
--(55555, 130, 'Bad Romance'),
--(66666, 130, 'Poker Face'),
--(99999, 140, 'Roar'),
--(101010, 140, 'Firework');

--Table: global_song_rank 

--CREATE TABLE global_song_rank (
--    day INT,
--    song_id INT,
--    rank INT
--);

--INSERT INTO global_song_rank (day, song_id, rank) VALUES
--(1, 45202, 5),
--(3, 45202, 2),
--(1, 19960, 3),
--(9, 19960, 6),
--(1, 55511, 8),
--(5, 22222, 7),
--(2, 33333, 4),
--(4, 44444, 8),
--(6, 55555, 1),
--(7, 66666, 10),
--(5, 99999, 5);


SELECT * FROM artists;
SELECT * FROM Songs;
SELECT * FROM global_song_rank;




SELECT artist_name,
Dense_Rank()OVER(ORDER BY COUNT(s.song_id)DESC)As artist_rank
FROM artists AS a
JOIN songs AS s
ON a.artist_id = s.artist_id
JOIN global_song_rank g
ON g.song_id = s.song_id
WHERE g.rank <= 10
GROUP BY a.artist_name;






