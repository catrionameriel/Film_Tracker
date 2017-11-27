require_relative('./string')
require_relative('./genre')
require_relative('../db/sql_runner')
require('date')

class Film

  attr_reader :id, :genre_id
  attr_accessor :title, :release_date, :seen, :rating, :date_seen

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre_id = details['genre_id'].to_i
    @release_date = details['release_date']
    # @release_date = Date.strptime(details['release_date'], '%d-%m-%Y')
    @seen = details['seen'].to_boolean
    @rating = details['rating'] if details['rating']
    @date_seen = details['date_seen']
  end

  def save()
    sql = 'INSERT INTO films(
    title,
    genre_id,
    release_date,
    seen,
    rating,
    date_seen
    )
    VALUES(
    $1, $2, $3, $4, $5, $6
    )
    RETURNING *'
    values = [
      @title,
      @genre_id,
      @release_date,
      @seen,
      @rating,
      @date_seen,
    ]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def self.delete_all
    sql = 'DELETE FROM films'
    result = SqlRunner.run(sql)
    return result
  end

  def self.all
    sql = 'SELECT * FROM films'
    result = SqlRunner.run(sql)
    films = result.map{ |film| Film.new(film) }
    return films
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM films WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    film = Film.new(result)
    return film
  end

  def genre()
    sql = 'SELECT * FROM genres WHERE id = $1'
    values = [@genre_id]
    result = SqlRunner.run(sql, values)[0]
    genre = Genre.new(result)
    return genre
  end

  def self.find_films_by_rating(rating)
    sql = 'SELECT * FROM films WHERE rating = $1'
    values = [rating]
    result = SqlRunner.run(sql, values)
    films = result.map{ |film| Film.new (film) }
    return films
  end

  def self.find_films_by_seen(seen)
    sql = 'SELECT * FROM films WHERE seen = $1'
    values = [seen]
    result = SqlRunner.run(sql, values)
    films = result.map { |film| Film.new (film) }
    return films
  end

  def update()
    sql = 'UPDATE films
    SET(
      title,
      genre_id,
      release_date,
      seen,
      rating,
      date_seen
      )=
      ($1, $2, $3, $4, $5, $6)
      WHERE id = $7'
      values = [
        @title,
        @genre_id,
        @release_date,
        @seen,
        @rating,
        @date_seen,
        @id
      ]
      result = SqlRunner.run(sql, values)
  end

  # def store_date
  #   @release_date = Date.parse(@release_date)
  #   if @date_seen.empty?
  #     @date_seen = NULL
  #   else
  #     @date_seen = Date.parse(@date_seen)
  #   end
  # end



end
