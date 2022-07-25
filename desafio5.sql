SELECT s.song_name AS cancao, COUNT(h.song_id) AS reproducoes
FROM songs AS s
INNER JOIN playback_history AS h
ON s.song_id = h.song_id
GROUP BY h.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2
;