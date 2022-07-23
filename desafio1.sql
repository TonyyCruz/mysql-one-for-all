CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(100) NOT NULL,
  years_old INT NOT NULL
);

CREATE TABLE plans (
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_type VARCHAR(100) NOT NULL,
  plan_value DECIMAL(6, 2) NOT NULL,
);

CREATE TABLE contracted_plan (
  contracted_id INT PRIMARY KEY AUTO_INCREMENT,
  contracted_type INT NOT NULL,
  user_id INT NOT NULL,
  signature_date DATE DEFAULT CURDATE() -- <=============
  FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (contracted_type) REFERENCES plans (plan_id)
);

CREATE TABLE artists (
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(100) NOT NULL,
);

CREATE TABLE following_artist (
  follow_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  is_following INT NOT NULL DEFAULT 1,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE albums (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL,
  artist_id INT NOT NULL,
  creation_date INT NOT NULL -- <=============================
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE songs (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(100) NOT NULL,
  duration INT NOT NULL,
  album_id INT,
);

CREATE TABLE playback_history (
  playback_history_id INT PRIMARY KEY AUTO_INCREMENT,
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  reproduction_date DATE DEFAULT NOW(),

  FOREIGN KEY (song_id) REFERENCES songs (song_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO users (user_id, user_name, years_old)
VALUES (1, Thati, 23),
(2, Cintia, 35),
(3, Bill, 20),
(4, Roger, 45),
(5, Norman, 58),
(6, Patrick, 33),
(7, Vivian, 26),
(8, Carol, 19),
(9, Angelina, 42),
(10, Paul, 46);

INSERT INTO plans (plan_id, plan_type, plan_value)
VALUES (1, gratuito, 0),
(2, pessoal, 6.99),
(3, familiar, 7.99),
(4, universitário, 5.99)
;

INSERT INTO contracted_plan (contracted_id, contracted_type, user_id, signature_date)
VALUES (1, 1, 1, '2019-10-20'),
(2, 3, 2, '2017-12-30'),
(3, 4, 3, '2019-06-05'),
(4, 2, 4, '2020-05-13'),
(5, 2, 5, '2017-02-17'),
(6, 3, 6, '2017-01-06'),
(7, 4, 7, '2018-01-05'),
(8, 4, 8, '2018-02-14'),
(9, 3, 9, '2018-04-29'),
(10, 3, 10, '2017-01-17'),
;

INSERT INTO artists(artist_id, artist_name)
VALUES (1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Shannon'),
(5, 'Tyler Isle'),
(6, 'Fog')
;

INSERT INTO following_artist (follow_id, user_id, artist_id, is_following)
VALUES (1, 1, 1, 1),
(2, 1, 4, 1),
(3, 1, 3, 1),
(4, 2, 1, 1),
(5, 2, 3, 1),
(6, 3, 2, 1),
(7, 3, 1, 1),
(8, 4, 4, 1),
(9, 5, 5, 1),
(10, 5, 6, 1),
(11, 6, 6, 1),
(12, 6, 3, 1),
(13, 6, 1, 1),
(14, 7, 2, 1),
(15, 7, 5, 1),
(16, 8, 1, 1),
(17, 8, 5, 1),
(18, 9, 6, 1),
(19, 9, 4, 1),
(20, 9, 3, 1),
(21, 10, 2, 1),
(22, 10, 6, 1),
;

INSERT INTO albums (album_id, album_name, artist_id, creation_date)
VALUES (1, 'Envious', 1, 1990),
(2, 'Exuberant', 1, 1993),
(3, 'Hallowed Steam', 2, 1995),
(4, 'Incandescent', 3, 1998),
(5, 'Temporary Culture', 4, 2001),
(6, 'Library of liberty', 4, 2003),
(7, 'Chained Down', 5, 2007),
(8, 'Cabinet of fools', 5, 2012),
(9, 'No guarantees', 5, 2015),
(10, 'Apparatus', 6, 2015),
;

    song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(100) NOT NULL,
  duration INT NOT NULL,
  album

INSERT INTO songs (song_id, song_name, duration, album_id)
VALUES ()
;

INSERT INTO playback_history ()
VALUES ()
;
