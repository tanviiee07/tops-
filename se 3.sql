-- task 1 --
SELECT * FROM music_streaming_app.musicplaylist;

-- task 2 --
INSERT INTO music_streaming_app.musicplaylist
(id, song_name, artist, genre, duration)
VALUES
(7, 'Excuses', 'AP Dhillon', 'Punjabi', 3.45),
(8, 'Brown Munde', 'AP Dhillon', 'Punjabi', 4.00),
(9, 'Perfect', 'Ed Sheeran', 'Pop', 4.23);

-- task 3 --
UPDATE music_streaming_app.musicplaylist
SET artist = 'Arijit Singh'
WHERE id = 1;

-- task 4 --
DELETE FROM music_streaming_app.musicplaylist
WHERE id > 0
  AND (
      FLOOR(duration) * 60
      + ROUND((duration - FLOOR(duration)) * 100)
  ) < 120;
  
-- task 5 --
UPDATE music_streaming_app.musicplaylist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE id IN (
    SELECT id
    FROM (
        SELECT id
        FROM music_streaming_app.musicplaylist
        WHERE artist = 'AP Dhillon'
          AND (
              FLOOR(duration) * 60
              + ROUND((duration - FLOOR(duration)) * 100)
          ) > 180
          AND song_name NOT LIKE '%(Remix)%'
    ) AS remix_songs
);