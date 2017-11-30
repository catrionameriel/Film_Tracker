require('sinatra')
require('pry')
require('sinatra/reloader')
require_relative('../models/genre')
require_relative('../models/film')


# Show all genres
get '/admin/genres' do
  @genres = Genre.all
  erb(:'genres/index')
end


# New genre
get '/admin/genres/new' do
  erb(:'genres/new')
end

# Create genre

post '/admin/genres' do
  Genre.new(params).save
  redirect to '/admin/genres'
end

# redirect to home

get '/admin' do
  redirect to '/admin/genres'
end

# Delete genre

delete '/admin/genres/:id/delete'do
  genre = Genre.find_by_id(params[:id])
  attached_films = genre.films
  deleted = genre.delete_if_not_in_use(attached_films)
  if
    deleted == true
  redirect to '/admin/genres'
  else
    erb(:'genres/not_deleted')
  end
end
