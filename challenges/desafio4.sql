SELECT DISTINCT(u.nome) AS pessoa_usuaria,
IF(MAX(YEAR(h.data_visualizacao)) > 2020, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h
ON u.usuario_id = h.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;