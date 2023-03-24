SELECT DISTINCT(u.nome) AS pessoa_usuaria,
	CASE
		WHEN h.data_visualizacao BETWEEN YEAR(2021) AND (NOW()) THEN 'Ativa'
		ELSE 'Inativa'
END AS 'status_pessoa_usuaria'
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h
ORDER BY pessoa_usuaria;