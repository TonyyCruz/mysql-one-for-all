SELECT DISTINCT u.user_name AS usuario,
IF(YEAR(h.reproduction_date) = '2021', 'Usuário ativo', 'Usuário inativo')
AS condicao_usuario
FROM users AS u
LEFT JOIN playback_history AS h
ON u.user_id = h.user_id AND YEAR(h.reproduction_date) = '2021'
ORDER BY u.user_name
;