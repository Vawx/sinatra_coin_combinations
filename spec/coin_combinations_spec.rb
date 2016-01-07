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
  it('gives 3 quaters when change is 75 cents') do
    expect(75.coin_combinations).to(eq("3 quarters"))
  end
  it('gives 3 quarters 1 nickel and 4 pennies when change is 84 cents') do
    expect(84.coin_combinations).to(eq("3 quarters 1 nickel 4 cents"))
  end
  it('gives 3 quarters 2 dimes and 4 cents when change is 99 cents') do
    expect(99.coin_combinations).to(eq("3 quarters 2 dimes 4 cents"))
  end
  it('gives 2 quarters and 4 cents when change is 54') do
    expect(54.coin_combinations).to(eq("2 quarters 4 cents"))
  end
  it('gives 2 quarters 2 dimes and two cents when change is 72') do
    expect(72.coin_combinations).to(eq("2 quarters 2 dimes 2 cents"))
  end
end
