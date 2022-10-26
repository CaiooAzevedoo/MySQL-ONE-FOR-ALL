DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

    CREATE TABLE SpotifyClone.plans(
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan_category VARCHAR(30) NOT NULL,
      plan_price FLOAT NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.user(
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(100) NOT NULL,
      user_age INT NOT NULL,
      plan_id INT NOT NULL FOREIGN KEY (plan_id) REFERENCES plans (plan_id),
      signature_date DATE
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.artists(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.albums(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(100) NOT NULL,
      album_release INT NOT NULL,
      artist_id INT NOT NULL FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.songs(
      songs_id INT PRIMARY KEY AUTO_INCREMENT,
      songs_name VARCHAR(100) NOT NULL,
      songs_duration INT NOT NULL,
      album_id INT NOT NULL FOREIGN KEY (album_id) REFERENCES albums (album_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.favorites(
      CONSTRAINT favorites_id PRIMARY KEY (artist_id, user_id),
      artist_id INT NOT NULL FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
      user_id INT NOT NULL FOREIGN KEY (user_id) REFERENCES users (user_id)
  ) engine = InnoDB;

    INSERT INTO SpotifyClone.plans (plan_id, plan_category, plan_price)
      VALUES
        (1, 'gratuito', 0.00),
        (2, 'universitário', 5.99),
        (3, 'pessoal', 6.99),
        (4, 'familiar', 7.99);

    INSERT INTO SpotifyClone.user (user_id, user_name, user_age, plan_id, signature_date)
      VALUES
        (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
        (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
        (3, 'Ada Lovelace', 37, 4, '2017-12-30'),
        (4, 'Martin Fowler', 46, 4, '2017-01-17'),
        (5, 'Sandi Metz', 58, 4, '2018-04-29'),
        (6, 'Paulo Freire', 19, 2, '2018-02-14'),
        (7, 'Bell Hooks', 26, 2, '2018-01-05'),
        (8, 'Christopher Alexander', 85, 3, '2019-06-05'),
        (9, 'Judith Butler', 45, 3, '2020-05-13'),
        (10, 'Jorge Amado', 58, 3, '2017-02-17');

    INSERT INTO SpotifyClone.artists (artist_id, artist_name)
      VALUES
        (1, 'Beyoncé'),
        (2, 'Queen'),
        (3, 'Elis Regina'),
        (4, 'Baco Exu do Blues'),
        (5, 'Blind Guardian'),
        (6, 'Nina Simone');

    INSERT INTO SpotifyClone.albums (album_id, album_name, album_release, artist_id)
      VALUES
        (1, 'Renaissance', 2022, 1),
        (2, 'Jazz', 1978, 2),
        (3, 'Hot Space', 1982, 2),
        (4, 'Falso Brilhante', 1998, 3),
        (5, 'Vento de Maio', 2001, 3),
        (6, 'QVVJFA?', 2003, 4),
        (7, 'Somewhere Far Beyond', 2007, 5),
        (8, 'I Put A Spell On You', 2012, 6);

    INSERT INTO SpotifyClone.songs (songs_id, songs_name, songs_duration, album_id )
      VALUES
      (1, 'Break my soul', 279, 1),
      (2, 'Virgo’s groove', 369, 1),
      (3, 'Alien superstar', 116, 1),
      (4, 'Don’t stop me now', 203, 2),
      (5, 'Under pressure', 152, 3),
      (6, 'Como nossos pais', 105, 4),
      (7, 'O medo de amar é o medo de ser livre', 207, 5),
      (8, 'Samba em Paris', 267, 6),
      (9, 'The bard’s song', 244, 7),
      (10, 'Feeling good', 100, 8);

    INSERT INTO SpotifyClone.favorites (artist_id, user_id)
    VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 5),
    (6, 6),
    (1, 6),
    (6, 7),
    (3, 9),
    (2, 10);
