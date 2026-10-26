-- task 1 --

CREATE TABLE playlist_S13 (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

INSERT INTO playlist_S13
(id, user_id, playlist_name, total_likes)
VALUES
(1, 101, 'Chill Vibes', 500),
(2, 101, 'Workout Hits', 800),
(3, 101, 'Romantic Songs', 600),
(4, 102, 'Party Mix', 900),
(5, 102, 'Study Music', 400),
(6, 102, 'Travel Songs', 700),
(7, 103, 'Lo-Fi Beats', 950),
(8, 103, 'Classic Hits', 650),
(9, 103, 'Morning Music', 750),
(10, 101, 'Night Drive', 800);

-- task 2 --
select 
		playlist_name,
        user_id,
        total_likes,
		row_number() over(
			order by total_likes desc, id 
            ) as row_num 
		from playlist_s13;
        
-- task 3 --
select 
		playlist_name,
        user_id,
        total_likes,
        rank() over(
			order by total_likes desc
            ) as playlist_rank 
		from playlist_s13
	order by playlist_rank;
    
    -- task 4 --
SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS user_playlist_rank
FROM playlist_S13
ORDER BY user_id, user_playlist_rank;

-- task 5 --
WITH RankedPlaylists AS (
    SELECT
        id,
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY total_likes DESC, id
        ) AS row_num
    FROM playlist_S13
)
SELECT
    playlist_name,
    user_id,
    total_likes,
    row_num
FROM RankedPlaylists
WHERE row_num <= 2
ORDER BY user_id, row_num;