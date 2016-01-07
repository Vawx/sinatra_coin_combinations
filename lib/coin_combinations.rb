class Fixnum
  coin_types_singlular = { 1 => " cent",
                           5 => " nickel",
                           10 => " dime",
                           25 => " quarter"}

  coin_types_plural = { 1 => " cents",
                        5 => " nickels",
                        10 => " dimes",
                        25 => " quarters" }

  define_method(:coin_combinations) do
    case self
      when 1..4
        pennies(self)
      when 5..9
        nickles(self)
      when 10..24
        dimes(self)
      when 25..99
        quaters(self)
    end
  end

  define_method(:pennies) do |penny|
    if penny == 1
      return penny.to_s + coin_types_singlular.fetch( 1 )
    else
      return penny.to_s + coin_types_plural.fetch( 1 )
    end
  end

  define_method(:nickles) do |nickle|
    remainder = nickle % 5
    how_many_nickles = (nickle - remainder) / 5

    if remainder == 0
      if how_many_nickles == 1
        return how_many_nickles.to_s + coin_types_singlular.fetch( 5 )
      else
        return how_many_nickles.to_s + coin_types_plural.fetch( 5 )
      end
    else
      pennies(remainder)
    end
  end

  define_method(:dimes) do |dime|
    remainder = dime % 10
    how_many_dimes = ( dime - remainder ) / 10

    if remainder == 0 && how_many_dimes <= 2
      if how_many_dimes == 1
        return how_many_dimes.to_s + coin_types_singlular.fetch( 10 )
      else
        return how_many_dimes.to_s + coin_types_plural.fetch( 10 )
      end
    else
      if remainder > 4
        if how_many_dimes == 1
          return how_many_dimes.to_s + coin_types_singlular.fetch( 10 ) + " " + nickels(remainder)
        else
          return how_many_dimes.to_s + coin_types_plural.fetch( 10 ) + " " + nickles(remainder)
        end
      else
        if how_many_dimes == 1
          return how_many_dimes.to_s + coin_types_singlular.fetch( 10 ) +  " " + pennies(remainder)
        else
          return how_many_dimes.to_s + coin_types_plural.fetch( 10 ) + " " + pennies(remainder)
        end
      end
    end
  end

  define_method(:quaters) do |quarter|
    remainder = quarter % 25
    how_many_quaters = (quarter - remainder) / 25

    if remainder == 0
      if how_many_quaters == 1
        return how_many_quaters.to_s + coin_types_singlular.fetch( 25 )
      else
        return how_many_quaters.to_s + coin_types_plural.fetch( 25 )
      end
    end

  end

end
