SELECT alb.nome AS album, COUNT(cf.cancao_id) AS favoritadas
FROM SpotifyClone.cancoes_favoritas AS cf
INNER JOIN SpotifyClone.cancoes AS c
INNER JOIN SpotifyClone.album AS alb
ON cf.cancao_id = c.cancao_id AND alb.album_id = c.album_id
GROUP BY alb.nome
ORDER BY favoritadas DESC
LIMIT 3;