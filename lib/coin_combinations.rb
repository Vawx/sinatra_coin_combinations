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
        if self == 1
          return self.to_s + coin_types_singlular.fetch( 1 )
        else
          return self.to_s + coin_types_plural.fetch( 1 )
        end
      when 5..9
        #NICKLES
      when 10..24
        #DIMES
      when 25..99
        #QUATERS
    end
  end
end
