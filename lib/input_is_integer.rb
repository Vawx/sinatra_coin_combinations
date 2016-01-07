class String
  define_method(:input_is_integer) do
    if self.length == 0 || self.to_i == 0
      return false
    end
    if self.to_i.to_s == self
      return true
    end
    return false
  end
end
