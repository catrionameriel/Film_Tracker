require('sinatra')
require('sinatra/reloader')
require_relative('../models/film')
require_relative('../models/genre')


get '/films' do
  @films = Film.find_films_by_seen(false)
  @genres = Genre.all
  erb(:'films/index')
end


get '/films/archive' do
  @films = Film.find_films_by_seen(true)
  @genres = Genre.all
  erb(:'films/archive')
end


get '/films/archive/rating' do
  @rating = params[:rating]
  @films = Film.find_films_by_rating(params[:rating].to_i)
  erb(:'films/rated')
end


get '/films/archive/genre' do
  @id = params[:id]
  @genre = Genre.find_by_id(@id)
  @films = @genre.films_seen
  erb(:'films/genre_seen')
end


get '/films/genre' do
  @id = params[:id]
  @genre = Genre.find_by_id(@id)
  @films = @genre.films_not_seen
  erb(:'films/genre_unseen')
end


get '/films/archive/:id' do
  @film = Film.find_by_id(params[:id])
  erb(:'films/more')
end


get '/films/new' do
  @genres = Genre.all
  erb(:'films/new')
end


post '/films' do
  params[:release_date] = Date.parse(params[:release_date])
  Film.check_params(params)
  @new_film = Film.new(params).save
  redirect to '/films/created'
end

get '/films/created' do
  erb(:'films/created_message')
end


get '/films/:id/edit' do
  @film = Film.find_by_id(params[:id])
  @genres = Genre.all
  erb(:'films/edit')
end


put '/films/:id/seen' do
  @film = Film.find_by_id(params[:id])
  @film.seen = "true"
  @film.update_seen
  redirect to '/films'
end


put '/films/:id' do
  params[:release_date] = Date.parse(params[:release_date])
  Film.check_params(params)
  Film.new(params).update
  redirect to '/films/updated'
end


get '/films/updated' do
  erb(:'films/update_message')
end


delete '/films/archive/:id/delete' do
  @film = Film.find_by_id(params[:id])
  @film.delete
  redirect to '/films/archive'
end


delete '/films/:id/delete' do
  @film = Film.find_by_id(params[:id])
  @film.delete
  redirect to '/films'
end
