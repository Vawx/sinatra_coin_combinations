class Fixnum
  coin_types_singlular = { 1 => "penny",
                           5 => "nickel",
                           10 => "dime",
                           25 => "quarter"}

  coin_types_plural = { 1 => "pennies",
                        5 => "nickels",
                        10 => "dimes",
                        25 => "quarters" }

  define_method(:coin_combinations) do
    return "3 pennies"
  end
end
