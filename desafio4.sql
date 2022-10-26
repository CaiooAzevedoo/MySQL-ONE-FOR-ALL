SELECT user.user_name AS usuario,
CASE 
	WHEN YEAR(MAX(played.played_date)) >= 2021 THEN 'Usuário ativo'
    ELSE 'Usuário inativo'
    END
AS status_usuario
FROM SpotifyClone.user
INNER JOIN SpotifyClone.played ON user.user_id = played.user_id
GROUP BY user.user_name ORDER BY user.user_name;
