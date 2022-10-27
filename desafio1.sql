DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

    CREATE TABLE SpotifyClone.plans (
      plan_id INT PRIMARY KEY AUTO_INCREMENT,
      plan_category VARCHAR(100) NOT NULL,
      plan_price FLOAT NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.user (
      user_id INT PRIMARY KEY AUTO_INCREMENT,
      user_name VARCHAR(100) NOT NULL,
      user_age INT NOT NULL,
      plan_id INT NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES plans (plan_id),
      signature_date DATE NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.artists(
      artist_id INT PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.albums(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      album_name VARCHAR(100) NOT NULL,
      album_release INT NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.songs(
      songs_id INT PRIMARY KEY AUTO_INCREMENT,
      songs_name VARCHAR(100) NOT NULL,
      songs_duration INT NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES albums (album_id),
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.favorites(
      CONSTRAINT favorites_id PRIMARY KEY (artist_id, user_id),
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
      user_id INT NOT NULL,
      FOREIGN KEY (user_id) REFERENCES user (user_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.played (
      CONSTRAINT played_id PRIMARY KEY (songs_id, user_id),
      songs_id INT NOT NULL,
      FOREIGN KEY (songs_id) REFERENCES songs (songs_id),
      played_date DATETIME NOT NULL,
      user_id INT NOT NULL,
      FOREIGN KEY (user_id) REFERENCES user (user_id)
  ) engine = InnoDB;

    INSERT INTO SpotifyClone.plans (plan_category, plan_price)
      VALUES
      ('gratuito', 0.00),
      ('universitário', 5.99),
      ('pessoal', 6.99),
      ('familiar', 7.99);

    INSERT INTO SpotifyClone.user (user_name, user_age, plan_id, signature_date)
      VALUES
      ('Barbara Liskov', 82, 1, '2019-10-20'),
      ('Robert Cecil Martin', 58, 1, '2017-01-06'),
      ('Ada Lovelace', 37, 4, '2017-12-30'),
      ('Martin Fowler', 46, 4, '2017-01-17'),
      ('Sandi Metz', 58, 4, '2018-04-29'),
      ('Paulo Freire', 19, 2, '2018-02-14'),
      ('Bell Hooks', 26, 2, '2018-01-05'),
      ('Christopher Alexander', 85, 3, '2019-06-05'),
      ('Judith Butler', 45, 3, '2020-05-13'),
      ('Jorge Amado', 58, 3, '2017-02-17');

    INSERT INTO SpotifyClone.artists (artist_name)
      VALUES
      ('Beyoncé'),
      ('Queen'),
      ('Elis Regina'),
      ('Baco Exu do Blues'),
      ('Blind Guardian'),
      ('Nina Simone');

    INSERT INTO SpotifyClone.albums (album_name, album_release, artist_id)
      VALUES
      ('Renaissance', 2022, 1),
      ('Jazz', 1978, 2),
      ('Hot Space', 1982, 2),
      ('Falso Brilhante', 1998, 3),
      ('Vento de Maio', 2001, 3),
      ('QVVJFA?', 2003, 4),
      ('Somewhere Far Beyond', 2007, 5),
      ('I Put A Spell On You', 2012, 6);

    INSERT INTO SpotifyClone.songs (songs_name, songs_duration, album_id, artist_id)
      VALUES
      ('Break my soul', 279, 1, 1),
      ('Virgo’s groove', 369, 1, 1),
      ('Alien superstar', 116, 1, 1),
      ('Don’t stop me now', 203, 2, 2),
      ('Under pressure', 152, 3, 2),
      ('Como nossos pais', 105, 4, 3),
      ('O medo de amar é o medo de ser livre', 207, 5, 3),
      ('Samba em Paris', 267, 6, 4),
      ('The bard’s song', 244, 7, 5),
      ('Feeling Good', 100, 8, 6);

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

    INSERT INTO SpotifyClone.played (songs_id, played_date, user_id)
      VALUES
      (8, '2022-02-28 10:45:55', 1),
      (2, '2020-05-02 05:30:35', 1),
      (10, '2020-03-06 11:22:33', 1),
      (10, '2022-08-05 08:05:17', 2),
      (7, '2020-01-02 07:40:33', 2),
      (10, '2020-11-13 16:55:13', 3),
      (2, '2020-12-05 18:38:30', 3),
      (8, '2021-08-15 17:10:10', 4),
      (8, '2022-01-09 01:44:33', 5),
      (5, '2020-08-06 15:23:43', 5),
      (7, '2017-01-24 00:31:17', 6),
      (1, '2017-10-12 12:35:20', 6),
      (4, '2011-12-15 22:30:49', 7),
      (4, '2012-03-17 14:56:41', 8),
      (9, '2022-02-24 21:14:22', 9),
      (3, '2015-12-13 08:30:22', 10); 
