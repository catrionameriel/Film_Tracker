DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS genres;

CREATE TABLE genres(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE films(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  genre_id INT4 REFERENCES genres(id) NOT NULL,
  release_date DATE,
  seen BOOLEAN NOT NULL,
  rating INT2,
  date_seen DATE
);
