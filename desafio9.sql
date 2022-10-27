SELECT COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.played
WHERE user_id = (
	SELECT user_id
	FROM SpotifyClone.user
	WHERE user_name = 'Barbara Liskov'
);
