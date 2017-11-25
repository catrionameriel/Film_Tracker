class String

  def to_boolean
    return true if self == 'true' || self == 't'
    return false if self.empty? || self =='false' || self == 'f'
  end

end
