require('pry-byebug')
require_relative('../models/genre')
require_relative('../models/film')

Film.delete_all
Genre.delete_all

genre1 = Genre.new({'type' => 'Action'})
genre1.save

genre2 = Genre.new({'type' => 'Romance'})
genre2.save

genre3 = Genre.new({'type' => 'Comedy'})
genre3.save

genre4 = Genre.new({'type' => 'Horror'})
genre4.save

genre5 = Genre.new({'type' => 'Drama'})
genre5.save

genre6 = Genre.new({'type' => 'Documentary'})
genre6.save

genre7 = Genre.new({'type' => 'Western'})
genre7.save

genre8 = Genre.new({'type' => 'Science Fiction'})
genre8.save

genre9 = Genre.new({'type' => 'Thriller'})
genre9.save

film1 = Film.new({
  'title' => 'Jaws',
  'genre_id' => genre9.id,
  'release_date' => '1975-06-20',
  'seen' => 'true',
  'rating' => '5',
  'date_seen' => '2000-06-15',
  })

film1.save

film2 = Film.new({
  'title' => 'Loving',
  'genre_id' => genre5.id,
  'release_date' => '2017-02-03',
  'seen' => 'false',
  'rating' => 'null',
  'date_seen' => 'null',
  })

  film2.save


binding.pry
nil
