require('sinatra')
require('sinatra/reloader')
require('pry')
require_relative('./models/film')
require_relative('./models/genre')
require_relative('./controllers/genres_controller')
require_relative('./controllers/films_controller')


get '/' do
  redirect to '/films'
end
