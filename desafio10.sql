SELECT songs.songs_name AS nome,
COUNT(played.user_id) AS reproducoes
FROM SpotifyClone.songs
INNER JOIN SpotifyClone.played ON songs.songs_id = played.songs_id
INNER JOIN SpotifyClone.user ON user.user_id = played.user_id
WHERE user.plan_id = 1 OR user.plan_id = 3
GROUP BY songs.songs_name ORDER BY songs.songs_name;
