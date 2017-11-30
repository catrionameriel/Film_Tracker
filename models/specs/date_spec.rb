require('minitest/autorun')
require('minitest/rg')
require_relative('../date')

class DateTest < Minitest::Test


  def test_date_is_not_a_string
    @date1 = '2000-12-05'
    assert_equal(2000-12-05, @date1.to_date)
  end

end
