DROP DATABASE IF EXISTS SpotifyCloneFavSongs;

CREATE TABLE SpotifyClone.cancoes_favoritas(
    usuario_id INT,
    cancao_id INT,
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id),
    CONSTRAINT PRIMARY KEY (usuario_id, cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes_favoritas (usuario_id, cancao_id)
VALUES
  (1, 6),
  (1, 10),
  (1, 3),
  (2, 4),
  (3, 1),
  (3, 3),
  (4, 4),
  (4, 7),
  (5, 2),
  (5, 10),
  (8, 4),
  (9, 7),
  (10, 3);