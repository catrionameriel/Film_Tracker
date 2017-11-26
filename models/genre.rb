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
    genres = result.map { |genre| Genre.new(genre) }
    return genres
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM genres WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    genre = Genre.new(result)
    return genre
  end


end
