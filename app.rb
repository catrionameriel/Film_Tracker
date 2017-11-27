require('sinatra')
require('sinatra/reloader')
require_relative('./models/film.rb')


# View all unseen
get '/' do
  @films = Film.find_films_by_seen(false)
  erb(:index)
end

# View all seen

# Edit

# Update
