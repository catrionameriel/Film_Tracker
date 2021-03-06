require_relative('../db/sql_runner')

class Genre

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save()
    sql = 'INSERT INTO genres(type)
    VALUES($1)
    RETURNING *'
    values = [@type]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id']
  end

  def self.delete_all()
    sql = 'DELETE FROM genres'
    result = SqlRunner.run(sql)
    return result
  end

  def self.all()
    sql = 'SELECT * FROM genres'
    result = SqlRunner.run(sql)
    genres = result.map { |genre| Genre.new (genre) }
    return genres
  end

  def delete()
    sql = 'DELETE FROM genres WHERE id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM genres WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    genre = Genre.new(result)
    return genre
  end

  def films_seen()
    sql = 'SELECT * FROM films WHERE genre_id = $1 AND seen = true'
    values = [@id]
    result = SqlRunner.run(sql, values)
    films = result.map { |film| Film.new(film) }
    return films
  end

  def films_not_seen()
    sql = 'SELECT * FROM films WHERE genre_id = $1 AND seen = false'
    values = [@id]
    result = SqlRunner.run(sql, values)
    films = result.map { |film| Film.new(film) }
    return films
  end

  def films()
    sql = 'SELECT * FROM films WHERE genre_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    films = result.map { |film| Film.new(film) }
    return films
  end

  def in_use?(films_to_check)
    return films_to_check.empty? ? false : true
  end

  def delete_if_not_in_use(films)
    answer = self.in_use?(films)
    if answer == false
      self.delete
      return true
    end
  end


end
