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


end
