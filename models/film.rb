require_relative('./string')
require_relative('./date')

class Film

  attr_reader :id, :genre_id
  attr_accessor :title, :release_date, :seen, :rating, :date_seen

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre_id = details['genre_id'].to_i
    @release_date = details['release_date']
    @seen = details['seen'].to_boolean
    @rating = details['rating'].to_i
    @date_seen = details['date_seen']
  end



end
