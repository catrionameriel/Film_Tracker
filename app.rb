require('sinatra')
require('sinatra/reloader')
require_relative('./models/film.rb')


# View all unseen
get '/' do
  @films = Film.find_films_by_seen(false)
  erb(:index)
end

# View all seen
get '/archive' do
  @films = Film.find_films_by_seen(true)
  erb(:archive)
end

# View more info
get '/archive/:id' do
  @film = Film.find_film_by_id(params[:id])
  erb(:more)
end

# Edit

# Update
