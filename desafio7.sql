SELECT 
artists.artist_name AS artista, 
albums.album_name AS album, 
COUNT(favorites.user_id) AS seguidores
FROM SpotifyClone.artists
INNER JOIN SpotifyClone.albums ON albums.artist_id = artists.artist_id
INNER JOIN SpotifyClone.favorites ON artists.artist_id = favorites.artist_id
GROUP BY artists.artist_name, albums.album_name
ORDER BY seguidores DESC, artists.artist_name, albums.album_name;
