SELECT song.song_name AS nome,
COUNT(hist.song_id) AS reproducoes
FROM songs AS song
INNER JOIN playback_history AS hist ON song.song_id = hist.song_id
INNER JOIN users AS u ON hist.user_id = u.user_id
INNER JOIN plans AS plan ON plan.plan_id = u.plan_id
AND plan.plan_type = 'pessoal' OR 'gratuito'

GROUP BY hist.song_id
ORDER BY nome
;