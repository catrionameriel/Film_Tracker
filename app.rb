require('sinatra')
require('sinatra/reloader')
require('pry')
require_relative('./models/film')
require_relative('./models/genre')


# View all unseen
get '/films' do
  @films = Film.find_films_by_seen(false)
  @genres = Genre.all
  erb(:index)
end

# View all seen
get '/films/archive' do
  @films = Film.find_films_by_seen(true)
  @genres = Genre.all
  erb(:archive)
end

# View films by rating
get '/films/archive/rating' do
  @rating = params[:rating]
  @films = Film.find_films_by_rating(params[:rating].to_i)
  erb(:rated)
end

# View seen films by genre
get '/films/archive/genre' do
  @id = params[:id]
  @genre = Genre.find_by_id(@id)
  @films = @genre.films_seen
  erb(:genre)
end

# View not seen films by genre
get '/films/genre' do
  @id = params[:id]
  @genre = Genre.find_by_id(@id)
  @films = @genre.films_not_seen
  erb(:genre)
end

# View more info
get '/films/archive/:id' do
  @film = Film.find_by_id(params[:id])
  erb(:more)
end

# New
get '/films/new' do
  @genres = Genre.all
  erb(:new)
end


# Create
post '/films' do
  params[:release_date] = Date.parse(params[:release_date])
  Film.check_params(params)
  @new_film = Film.new(params).save
  redirect to '/films'
end

# Edit
get '/films/:id/edit' do
  @film = Film.find_by_id(params[:id])
  @genres = Genre.all
  erb(:edit)
end

# Update
put '/films/:id' do
  params[:release_date] = Date.parse(params[:release_date])
  Film.check_params(params)
  Film.new(params).update
  redirect to '/films'
end

# Delete seen
delete '/films/archive/:id/delete' do
  @film = Film.find_by_id(params[:id])
  @film.delete
  redirect to '/films/archive'
end

# Delete unseen
delete '/films/:id/delete' do
  @film = Film.find_by_id(params[:id])
  @film.delete
  redirect to '/films'
end
