DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;


CREATE TABLE SpotifyClone.plano(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
    pessoa_usuaria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT,
    data_assinatura DATE NOT NULL,
    CONSTRAINT PRIMARY KEY (plano_id),
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
	artista_id INT PRIMARY KEY AUTO_INCREMENT,
	artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista_id INT,
    ano_lancamento INT NOT NULL,
    CONSTRAINT PRIMARY KEY (artista_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
    cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
    cancoes VARCHAR(50) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT,
    CONSTRAINT PRIMARY KEY (album_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.reproducao(
    pessoa_usuaria_id INT,
    cancoes_id INT,
    data_reproducao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PRIMARY KEY (pessoa_usuaria_id, cancoes_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.usuario(pessoa_usuaria_id),
    FOREIGN KEY (cancoes_id) REFERENCES SpotifyClone.cancoes(cancoes_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas_seguidos(
    pessoa_usuaria_id INT,
    seguindo_artistas INT,
    CONSTRAINT PRIMARY KEY(pessoa_usuaria_id, seguindo_artistas),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.usuario(pessoa_usuaria_id),
    FOREIGN KEY (seguindo_artistas) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.usuario (nome_pessoa_usuaria, idade, plano_id, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artista (artista)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.albuns (album, artista_id, ano_lancamento)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO SpotifyClone.cancoes (cancoes, duracao_segundos)
VALUES
  ('BREAK MY SOUL', 279),
  ("VIRGO'S GROOVE", 369),
  ('ALIEN SUPERSTAR', 116),
  ("Don't Stop Me Now", 203),
  ('Under Pressure', 152),
  ('Como Nossos Pais', 105),
  ('O Medo de Amar é o Medo de Ser Livre', 207),
  ('Samba em Paris', 267),
  ("The Bard's Song", 244),
  ('Feeling Good', 100);

INSERT INTO SpotifyClone.plano (plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.reproducao (cancoes_id, data_reproducao)
VALUES
  (8, '2022-02-28 10:45:55'),
  (2, '2020-05-02 5:30:35'),
  (10, '2020-03-06 11:22:33'),
  (10, '2022-08-05 8:05:17'),
  (7, '2020-01-02 7:40:33'),
  (10, '2020-11-13 16:55:13'),
  (2, '2020-12-05 18:38:30'),
  (8, '2021-08-15 17:10:10'),
  (8, '2022-01-09 1:44:33'),
  (5, '2020-08-06 15:23:43'),
  (7, '2017-01-24 0:31:17'),
  (1, '2017-10-12 12:35:20'),
  (4, '2011-12-15 22:30:49'),
  (4, '2012-03-17 14:56:41'),
  (9, '2022-02-24 21:14:22'),
  (3, '2015-12-13 8:30:22');

INSERT INTO SpotifyClone.artistas_seguidos (pessoa_usuaria_id, seguindo_artistas)
VALUES
  (1, 1),
  (1, 3),
  (1, 2),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);