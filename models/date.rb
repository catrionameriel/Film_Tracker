require('date')

class Date

  def to_date
    string = self
    date = Date.parse(string)
    return date
  end

end
