SELECT songs.songs_name AS nome_musica,
    CASE
		WHEN songs.songs_name = 'The Bard’s Song' THEN REPLACE(songs_name, 'Bard', 'QA')
    WHEN songs.songs_name = 'O Medo de Amar é o Medo de Ser Livre' THEN REPLACE(songs_name, 'Amar', 'Code Review')
		WHEN songs.songs_name = 'Como Nossos Pais' THEN REPLACE(songs_name, 'Pais', 'Pull Requests')
    WHEN songs.songs_name = 'BREAK MY SOUL' THEN REPLACE(songs_name, 'SOUL', 'CODE')
    WHEN songs.songs_name = 'ALIEN SUPERSTAR' THEN REPLACE(songs_name, 'SUPERSTAR', 'SUPERDEV')
    END AS novo_nome
FROM SpotifyClone.songs
WHERE songs.songs_name IN ('The Bard’s Song', 'O Medo de Amar é o Medo de Ser Livre', 'Como Nossos Pais', 'BREAK MY SOUL', 'ALIEN SUPERSTAR')
ORDER BY songs_name DESC;
