SELECT art.nome AS artista, alb.nome AS album, COUNT(usg.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
INNER JOIN SpotifyClone.usuario_segue AS usg
ON art.artista_id = usg.artista_id AND alb.artista_id = usg.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album;