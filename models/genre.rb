class Genre

  attr_reader :id
  attr_accessor :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end


end
