require('minitest/autorun')
require('minitest/rg')
require_relative('../film')

class FilmTest < Minitest::Test


  def setup()
    @film1 = Film.new({
      'id' => '1',
      'title' => "Schindler's List",
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

  def test_film_has_title
    assert_equal("Schindler's List", @film1.title)
  end

  def test_film_has_genre_id
    assert_equal(1, @film1.genre_id)
  end

  def test_film_has_release_date
    assert_equal('1994-07-06', @film2.release_date)
  end

  def test_film_been_seen
    assert_equal(true, @film1.seen)
  end

  def test_film_not_seen
    assert_equal(false, @film2.seen)
  end

  def test_film_has_rating
    assert_equal(5, @film1.rating)
  end

  def test_film_has_no_rating
    assert_equal(0, @film2.rating)
  end

  def test_film_has_date_seen
    assert_equal('2000-12-06', @film1.date_seen)
  end

  def test_film_has_date_seen__not
    assert_equal('null', @film2.date_seen)
  end


end
