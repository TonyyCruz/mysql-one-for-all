SELECT art.artist_name AS artista,
alb.album_name AS album,
COUNT(fol.user_id) AS seguidores
FROM artists AS art
INNER JOIN albums AS alb ON art.artist_id = alb.artist_id
INNER JOIN following_artist AS fol ON fol.artist_id = art.artist_id
GROUP BY alb.album_id
ORDER BY seguidores DESC, artista, album
;