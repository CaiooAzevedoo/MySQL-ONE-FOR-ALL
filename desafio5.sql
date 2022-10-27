SELECT songs.songs_name AS cancao, 
COUNT(user_id) AS reproducoes
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.played ON songs.songs_id = played.songs_id
GROUP BY songs.songs_name ORDER BY reproducoes DESC , songs.songs_name ASC
LIMIT 2;
