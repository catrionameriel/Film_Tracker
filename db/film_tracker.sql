DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS genres;

CREATE TABLE genres(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE films(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  genre_id INT4 REFERENCES genres(id),
  release_date VARCHAR(255),
  seen BOOLEAN,
  rating INT2,
  date_seen VARCHAR(255)
);
