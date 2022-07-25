CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_type VARCHAR(100) NOT NULL,
  plan_value DECIMAL(6, 2) NOT NULL
);

CREATE TABLE users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(100) NOT NULL,
  years_old INT NOT NULL,
  contracted_type INT NOT NULL,
  FOREIGN KEY (contracted_type) REFERENCES plans (plan_id)
);

CREATE TABLE contracted_plan_history (
  contracted_id INT PRIMARY KEY AUTO_INCREMENT,
  contracted_type INT NOT NULL,
  user_id INT NOT NULL,
  signature_date DATE,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (contracted_type) REFERENCES plans (plan_id)
);

CREATE TABLE artists (
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(100) NOT NULL
);

CREATE TABLE following_artist (
  follow_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  is_following TINYINT NOT NULL DEFAULT 1,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE albums (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL,
  artist_id INT NOT NULL,
  creation_date INT NOT NULL, -- <=============================
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE songs (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(100) NOT NULL,
  duration INT NOT NULL,
  album_id INT
);

CREATE TABLE playback_history (
  history_id INT PRIMARY KEY AUTO_INCREMENT,
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  reproduction_date DATETIME,

  FOREIGN KEY (song_id) REFERENCES songs (song_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO plans (plan_id, plan_type, plan_value)
VALUES (1, 'gratuito', 0),
(2, 'pessoal', 6.99),
(3, 'familiar', 7.99),
(4, 'universitário', 5.99);

INSERT INTO users (user_id, user_name, years_old, contracted_type)
VALUES (1, 'Thati', 23, 1),
(2, 'Cintia', 35, 3),
(3, 'Bill', 20, 4),
(4, 'Roger', 45, 2),
(5, 'Norman', 58, 2),
(6, 'Patrick', 33, 3),
(7, 'Vivian', 26, 4),
(8, 'Carol', 19, 4),
(9, 'Angelina', 42, 3),
(10, 'Paul', 46, 3);

INSERT INTO contracted_plan_history (contracted_id, contracted_type, user_id, signature_date)
VALUES (1, 1, 1, '2019-10-20'),
(2, 3, 2, '2017-12-30'),
(3, 4, 3, '2019-06-05'),
(4, 2, 4, '2020-05-13'),
(5, 2, 5, '2017-02-17'),
(6, 3, 6, '2017-01-06'),
(7, 4, 7, '2018-01-05'),
(8, 4, 8, '2018-02-14'),
(9, 3, 9, '2018-04-29'),
(10, 3, 10, '2017-01-17');

INSERT INTO artists(artist_id, artist_name)
VALUES (1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Shannon'),
(5, 'Tyler Isle'),
(6, 'Fog');

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
(22, 10, 6, 1);

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
(10, 'Apparatus', 6, 2015);

INSERT INTO songs (song_id, song_name, duration, album_id)
VALUES (1, 'Soul For Us', 200, 1),
(2, 'Reflections Of Magic', 163, 1),
(3, 'Dance With Her Own', 116, 1),
(4, 'Troubles Of My Inner Fire', 203, 2),
(5, 'Time Fireworks', 152, 2),
(6, 'Magic Circus', 105, 3),
(7, 'Honey, So Do I', 207, 3),
(8, "Sweetie, Let's Go Wild", 139, 3),
(9, 'She Knows', 244, 3),
(10, 'Fantasy For Me', 100, 4),
(11, 'Celebration Of More', 146, 4),
(12, 'Rock His Everything', 223, 4),
(13, 'Home Forever', 231, 4),
(14, 'Diamond Power', 241, 4),
(15, "Let's Be Silly", 132, 4),
(16, 'Thang Of Thunder', 240, 5),
(17, 'Words Of Her Life', 185, 5),
(18, 'Without My Streets', 176, 5),
(19, 'Need Of The Evening', 190, 6),
(20, 'History Of My Roses', 222, 6),
(21, 'Without My Love', 111, 6),
(22, 'Walking And Game', 123, 6),
(23, 'Young And Father', 197, 6),
(24, 'Finding My Traditions', 179, 7),
(25, 'Walking And Man', 229, 7),
(26, 'Hard And Time', 135, 7),
(27, "Honey, I'm A Lone Wolf", 150, 7),
(28, "She Thinks I Won't Stay Tonight", 166, 8),
(29, "He Heard You're Bad For Me", 154, 8),
(30, "He Hopes We Can't Stay", 210, 8),
(31, 'I Know I Know', 117, 8),
(32, "He's Walking Away", 159, 9),
(33, "He's Trouble", 138, 9),
(34, 'I Heard I Want To Bo Alone', 120, 9),
(35, 'I Ride Alone', 151, 9),
(36, 'Honey', 79, 10),
(37, 'You Cheated On Me', 95, 10),
(38, "Wouldn't It Be Nice", 213, 10),
(39, 'Baby', 136, 10),
(40, 'You Make Me Feel So..', 83, 10);

INSERT INTO playback_history (history_id, song_id, user_id, reproduction_date)
VALUES (1, 36, 1, '2020-02-28 10:45:55'),
(2, 25, 1, '2020-05-02 05:30:35'),
(3, 23, 1, '2020-03-06 11:22:33'),
(4, 14, 1, '2020-08-05 08:05:17'),
(5, 15, 1, '2020-09-14 16:32:22'),
(6, 34, 2, '2020-01-02 07:40:33'),
(7, 24, 2, '2020-05-16 06:16:22'),
(8, 21, 2, '2020-10-09 12:27:48'),
(9, 39, 2, '2020-09-21 13:14:46'),
(10, 6, 3, '2020-11-13 16:55:13'),
(11, 3, 3, '2020-12-05 18:38:30'),
(12, 26, 3, '2020-07-30 10:00:00'),
(13, 2, 4, '2021-08-15 17:10:10'),
(14, 35, 4, '2021-07-10 15:20:30'),
(15, 27, 4, '2021-01-09 01:44:33'),
(16, 7, 5, '2020-07-03 19:33:28'),
(17, 12, 5, '2017-02-24 21:14:22'),
(18, 14, 5, '2020-08-06 15:23:43'),
(19, 1, 5, '2020-11-10 13:52:27'),
(20, 38, 6, '2019-02-07 20:33:48'),
(21, 29, 6, '2017-01-24 00:31:17'),
(22, 30, 6, '2017-10-12 12:35:20'),
(23, 22, 6, '2018-05-29 14:56:41'),
(24, 5, 7, '2018-05-09 22:30:49'),
(25, 4, 7, '2020-07-27 12:52:58'),
(26, 11, 7, '2018-01-16 18:40:43'),
(27, 39, 8, '2018-03-21 16:56:40'),
(28, 40, 8, '2020-10-18 13:38:05'),
(29, 32, 8, '2019-05-25 08:14:03'),
(30, 33, 8, '2021-08-15 21:37:09'),
(31, 16, 9, '2021-05-24 17:23:45'),
(32, 17, 9, '2018-12-07 22:48:52'),
(33, 8, 9, '2021-03-14 06:14:26'),
(34, 9, 9, '2020-04-01 03:36:00'),
(35, 20, 10, '2017-02-06 08:21:34'),
(36, 21, 10, '2017-12-04 05:33:43'),
(37, 12, 10, '2017-07-27 05:24:49'),
(38, 13, 10, '2017-12-25 01:03:57')
;
