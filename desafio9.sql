SELECT COUNT(hist.user_id) AS quantidade_musicas_no_historico
FROM playback_history AS hist
INNER JOIN users AS u ON u.user_id = hist.user_id
WHERE u.user_name LIKE UCASE('BILL')
GROUP BY hist.user_id
;