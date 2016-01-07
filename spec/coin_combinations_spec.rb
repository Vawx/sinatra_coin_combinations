require('rspec')
require('coin_combinations')

describe('Fixnum#coin_combinations') do
  it('gives single penny when change is 1 cent') do
    expect(1.coin_combinations).to( eq("1 cent"))
  end
  it('gives pennies when change is less than 5 cents') do
    expect(3.coin_combinations).to( eq("3 cents"))
  end
  it('gives 1 nickle when change is 5 cents') do
    expect(5.coin_combinations).to( eq("1 nickel"))
  end
  it('gives 2 dimes when change is 20 cents') do
    expect(20.coin_combinations).to( eq("2 dimes"))
  end
  it('gives 2 dimes and three pennies when change is 23 cents') do
    expect(23.coin_combinations).to(eq("2 dimes 3 cents"))
  end
  it('gives 1 quater when change is 25 cents') do
    expect(25.coin_combinations).to(eq("1 quarter"))
  end
end
