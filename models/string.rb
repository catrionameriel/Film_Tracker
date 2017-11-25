class String

  def to_boolean
    return true if self == 'true'
    return false if self.empty? || self=='false'
  end

end
