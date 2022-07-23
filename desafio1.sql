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
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE albums (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(100) NOT NULL,
  artist INT,
  creation_date INT NOT NULL -- <=============================
  FOREIGN KEY (artist) REFERENCES artists (artist_id)
);

CREATE TABLE songs (
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(100) NOT NULL,
  duration INT NOT NULL,
  album INT,
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

INSERT INTO contracted_plan ()
VALUES ()
;

INSERT INTO artists()
VALUES ()
;

INSERT INTO following_artist ()
VALUES ()
;

INSERT INTO albums ()
VALUES ()
;

INSERT INTO songs ()
VALUES ()
;

INSERT INTO playback_history ()
VALUES ()
;
