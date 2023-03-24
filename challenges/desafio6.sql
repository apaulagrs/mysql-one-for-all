SELECT MIN(p.preco) AS faturamento_minimo, 
MAX(p.preco) AS faturamento_maximo, 
ROUND(AVG(
	CASE
		WHEN u.plano_id = 1 THEN 0
        WHEN u.plano_id = 2 THEN 7.99
        WHEN u.plano_id = 3 THEN 5.99
        ELSE 6.99
END), 2) AS faturamento_medio,
SUM(
	CASE
		WHEN u.plano_id = 1 THEN 0
        WHEN u.plano_id = 2 THEN 7.99
        WHEN u.plano_id = 3 THEN 5.99
        ELSE 6.99
END) AS faturamento_total
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.plano AS p
ON u.plano_id = p.plano_id;