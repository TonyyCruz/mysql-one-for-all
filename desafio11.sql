SELECT 
	song_name AS nome_musica,
    CASE 
		WHEN song_name LIKE '%Dance With Her Own%' THEN REPLACE(song_name, 'Her Own', 'Trybe')
        WHEN song_name LIKE '%Be Silly%' THEN REPLACE(song_name, 'Silly', 'Nice')
        WHEN song_name LIKE '%Magic Circus%' THEN REPLACE(song_name, 'Circus', 'Pull Request')
        WHEN song_name LIKE '%My Inner Fire%' THEN REPLACE(song_name, 'Inner Fire', 'Project')
		WHEN song_name LIKE '%Without My Streets%' THEN REPLACE(song_name, 'Streets', 'Code Review')
	END 
    AS novo_nome

	FROM songs
	WHERE song_name LIKE '%Dance With Her Own%'
	OR song_name LIKE '%Be Silly%'
	OR song_name LIKE '%Magic Circus%'
	OR song_name LIKE '%My Inner Fire%'
	OR song_name LIKE '%Without My Streets%'
	ORDER BY nome_musica;