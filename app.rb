require('sinatra')
require('sinatra/reloader')
require('pry')
require_relative('./models/film')
require_relative('./models/genre')


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

# New
get '/new' do
  @genres = Genre.all
  erb(:new)
end


# Create
post '/' do
  params[:release_date] = Date.parse(params[:release_date])
  if params[:date_seen].empty?
    params[:date_seen] = nil
  else
    params[:date_seen] = Date.parse(params[:date_seen])
  end
  @new_film = Film.new(params).save
  redirect to '/'
end


# View more info
get '/archive/:id' do
  @film = Film.find_by_id(params[:id])
  erb(:more)
end

# Edit
get '/:id/edit' do
  @film = Film.find_by_id(params[:id])
  @genres = Genre.all
  erb(:edit)
end

# Update
put '/:id' do
  params[:release_date] = Date.parse(params[:release_date])
  if params[:date_seen].empty?
    params[:date_seen] = nil
  else
    params[:date_seen] = Date.parse(params[:date_seen])
  end
  Film.new(params).update
  redirect to '/'
end
