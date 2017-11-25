require('pry-byebug')
require_relative('../models/genre')


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




binding.pry
nil
