SELECT COUNT(DISTINCT can.cancao_id) AS cancoes, COUNT(DISTINCT art.nome) AS artistas, COUNT(DISTINCT alb.nome) AS albuns
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON alb.album_id = can.album_id;