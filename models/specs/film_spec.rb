require('minitest/autorun')
require('minitest/rg')
require_relative('../film')

class FilmTest < Minitest::Test


  def setup()
    @film1 = Film.new({
      'id' => '1',
      'title' => 'Schindlers List',
      'genre_id' => '1',
      'release_date' => '1993-11-30',
      'seen' => 'true',
      'rating' => '5',
      'date_seen' => '2000-12-06',
      })

      @film2 = Film.new({
        'id' => '2',
        'title' => 'Forest Gump',
        'genre_id' => '1',
        'release_date' => '1994-07-06',
        'seen' => 'false',
        'rating' => 'null',
        'date_seen' => 'null',
        })
  end

  def test_film_has_id
    assert_equal(1, @film1.id)
  end


end
