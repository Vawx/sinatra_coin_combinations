class Fixnum
  coin_types_singlular = { 1 => " penny",
                           5 => " nickel",
                           10 => " dime",
                           25 => " quarter"}

  coin_types_plural = { 1 => " pennies",
                        5 => " nickels",
                        10 => " dimes",
                        25 => " quarters" }

  define_method(:coin_combinations) do
    case self
      when 1..4
        #PENNIES
        pennies()
      when 5..9
        #NICKLES
        nickles()
      when 10..24
        #DIMES
      when 25..99
        #QUATERS
    end
  end

  define_method(:pennies) do
    if self == 1
      return self.to_s + coin_types_singlular.fetch( 1 )
    else
      return self.to_s + coin_types_plural.fetch( 1 )
    end
  end

  define_method(:nickles) do
    remainder = self % 5
    how_many_nickles = (self - remainder) / 5

    if how_many_nickles == 1
      return how_many_nickles.to_s + coin_types_singlular.fetch( 5 )
    else
      return how_many_nickles.to_s + coin_types_plural.fetch( 5 )
    end
  end

  define_method(:dimes) do
    remainder = self % 10
    how_many_dimes = ( self - remainder ) / 10
  end


end
