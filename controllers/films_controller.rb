require('sinatra')
require('pry')
require('sinatra/reloader')
require_relative('../models/film')
require_relative('../models/genre')

# View all unseen
get '/films' do
  @films = Film.find_films_by_seen(false)
  @genres = Genre.all
  erb(:'films/index')
end

# View all seen
get '/films/archive' do
  @films = Film.find_films_by_seen(true)
  @genres = Genre.all
  erb(:'films/archive')
end

# View films by rating
get '/films/archive/rating' do
  @rating = params[:rating]
  @films = Film.find_films_by_rating(params[:rating].to_i)
  erb(:'films/rated')
end

# View seen films by genre
get '/films/archive/genre' do
  @id = params[:id]
  @genre = Genre.find_by_id(@id)
  @films = @genre.films_seen
  erb(:'films/genre_seen')
end

# View not seen films by genre
get '/films/genre' do
  @id = params[:id]
  @genre = Genre.find_by_id(@id)
  @films = @genre.films_not_seen
  erb(:'films/genre_unseen')
end

# View more info
get '/films/archive/:id' do
  @film = Film.find_by_id(params[:id])
  erb(:'films/more')
end

# New
get '/films/new' do
  @genres = Genre.all
  erb(:'films/new')
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
  erb(:'films/edit')
end

# Edit to seen
put '/films/:id/seen' do
  @film = Film.find_by_id(params[:id])
  @film.seen = "true"
  @film.update_seen
  redirect to '/films'
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
