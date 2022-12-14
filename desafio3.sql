SELECT u.user_name AS usuario,
count(h.USER_id) AS qtde_musicas_ouvidas,
ROUND(SUM(s.duration) / 60, 2) AS total_minutos
FROM users AS u
INNER JOIN playback_history AS h ON u.user_id = h.user_id
INNER JOIN songs AS s ON s.song_id = h.song_id AND u.user_id = h.user_id
GROUP BY h.user_id
ORDER BY u.user_name
;
