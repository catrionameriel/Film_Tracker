require('minitest/autorun')
require('minitest/rg')
require_relative('../genre')

class TestGenre < MiniTest::Test

  def setup
    @genre1 = Genre.new({ 'id' => '1', 'type' => 'Comedy'})
    @genre2 = Genre.new({ 'id' => '2', 'type' => 'Horror'})
  end

  def test_genre_has_id
    assert_equal(1, @genre1.id)
  end

  def test_genre_has_type
    assert_equal('Horror', @genre2.type)
  end


end
