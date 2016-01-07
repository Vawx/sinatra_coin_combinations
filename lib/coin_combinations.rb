require('pry')
class Fixnum
  coin_types_singlular = { 1 => " penny",
                           5 => " nickel",
                           10 => " dime",
                           25 => " quarter"}

  coin_types_plural =     { 1 => " pennies",
                            5 => " nickels",
                            10 => " dimes",
                            25 => " quarters" }

  coin_amounts =          { "quarters" => 0,
                            "dimes" => 0,
                            "nickels" => 0 }

  define_method(:coin_combinations) do |register_coins|

    coin_amounts["quarters"] = register_coins[ 0 ]
    coin_amounts["dimes"] = register_coins[ 1 ]
    coin_amounts["nickels"] = register_coins[ 2 ]

    case self
      when 1..4
        pennies(self)
      when 5..9
        nickles(self)
      when 10..24
        dimes(self)
      when 25..50000
        quarters(self)
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
    nickels_in_register = coin_amounts.fetch("nickels")
    nickles_as_word = ""

    if  nickels_in_register > 0
      if how_many_nickles > nickels_in_register
        nickel_conversion = (how_many_nickles - nickels_in_register) * 5
        remainder += nickel_conversion
        how_many_nickles = nickels_in_register
      end
    end

    if how_many_nickles == 1
      nickles_as_word = how_many_nickles.to_s + coin_types_singlular.fetch( 5 )
    else
      nickles_as_word = how_many_nickles.to_s + coin_types_plural.fetch( 5 )
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
    dimes_in_register = coin_amounts.fetch("dimes")
    dimes_as_word = ""

    if dimes_in_register > 0
      if how_many_dimes > dimes_in_register
          dimes_conversion = (how_many_dimes - dimes_in_register) * 10
          remainder += dimes_conversion
          how_many_dimes = dimes_in_register
      end
    end

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

  define_method(:quarters) do |quarter|
    remainder = quarter % 25
    how_many_quarters = (quarter - remainder) / 25
    quarters_in_register = coin_amounts.fetch("quarters")
    quarters_as_word = ""

    if quarters_in_register > 0
      if how_many_quarters > quarters_in_register
        dime_conversion = (how_many_quarters - quarters_in_register) * 25
        remainder += dime_conversion
        how_many_quarters = quarters_in_register
      end
    end

    if how_many_quarters == 1
      quarters_as_word = how_many_quarters.to_s + coin_types_singlular.fetch( 25 )
    else
      quarters_as_word = how_many_quarters.to_s + coin_types_plural.fetch( 25 )
    end

    if remainder == 0
      return quarters_as_word
    else
      if remainder > 9
        return quarters_as_word + " " +  dimes(remainder)
      elsif remainder > 4
        return quarters_as_word + " " +  nickles(remainder)
      else
        return quarters_as_word + " " +  pennies(remainder)
      end
    end
  end
end
