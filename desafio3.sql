SELECT user.user_name AS usuario, 
COUNT(played.songs_id) AS qt_de_musicas_ouvidas, 
ROUND(SUM(songs.songs_duration) / 60, 2) AS total_minutos
FROM SpotifyClone.user
INNER JOIN SpotifyClone.played ON user.user_id = played.user_id
INNER JOIN SpotifyClone.songs ON played.songs_id = songs.songs_id
GROUP BY user.user_name ORDER BY user.user_name ASC;
