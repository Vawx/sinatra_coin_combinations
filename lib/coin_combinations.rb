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
    nickles_as_word = ""

    if how_many_nickles == 1
      nickles_as_word = how_many_nickles.to_s + coin_types_singlular.fetch( 5 )
    else
      nickles_as_word how_many_nickles.to_s + coin_types_plural.fetch( 5 )
    end

    if remainder == 0
      return nickles_as_word
    else
      return nickles_as_word.to_s + " " + pennies(remainder)
    end
  end

  define_method(:dimes) do |dime|
    remainder = dime % 10
    how_many_dimes = ( dime - remainder ) / 10
    dimes_as_word = ""

    if how_many_dimes == 1
      dimes_as_word = how_many_dimes.to_s + coin_types_singlular.fetch( 10 )
    else
      dimes_as_word = how_many_dimes.to_s + coin_types_plural.fetch( 10 )
    end

    if remainder == 0
      return dimes_as_word
    else
      if remainder > 4
        return dimes_as_word + " " + nickles(remainder)
      else
        return dimes_as_word + " " + pennies(remainder)
      end
    end
  end

  define_method(:quaters) do |quarter|
    remainder = quarter % 25
    how_many_quaters = (quarter - remainder) / 25
    quaters_as_word = ""

    if how_many_quaters == 1
      quaters_as_word = how_many_quaters.to_s + coin_types_singlular.fetch( 25 )
    else
      quaters_as_word = how_many_quaters.to_s + coin_types_plural.fetch( 25 )
    end

    if remainder == 0
      return quaters_as_word
    else
      if remainder > 9
        return quaters_as_word + " " +  dimes(remainder)
      elsif remainder > 4
        return quaters_as_word + " " +  nickles(remainder)
      else
        return quaters_as_word + " " +  pennies(remainder)
      end
    end
  end
end
