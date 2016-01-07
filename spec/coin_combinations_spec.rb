require('rspec')
require('coin_combinations')

describe('Fixnum#coin_combinations') do
  it('gives single penny when change is 1 cent') do
    expect(1.coin_combinations([0,0,0])).to( eq("1 penny"))
  end
  it('gives pennies when change is less than 5 pennies') do
    expect(3.coin_combinations([0,0,0])).to( eq("3 pennies"))
  end
  it('gives 1 nickle when change is 5 pennies') do
    expect(5.coin_combinations([0,0,0])).to( eq("1 nickel"))
  end
  it('gives 2 dimes when change is 20 pennies') do
    expect(20.coin_combinations([0,0,0])).to( eq("2 dimes"))
  end
  it('gives 2 dimes and three pennies when change is 23 pennies') do
    expect(23.coin_combinations([0,0,0])).to(eq("2 dimes 3 pennies"))
  end
  it('gives 1 quater when change is 25 pennies') do
    expect(25.coin_combinations([0,0,0])).to(eq("1 quarter"))
  end
  it('gives 3 quaters when change is 75 pennies') do
    expect(75.coin_combinations([0,0,0])).to(eq("3 quarters"))
  end
  it('gives 3 quarters 1 nickel and 4 pennies when change is 84 pennies') do
    expect(84.coin_combinations([0,0,0])).to(eq("3 quarters 1 nickel 4 pennies"))
  end
  it('gives 3 quarters 2 dimes and 4 pennies when change is 99 pennies') do
    expect(99.coin_combinations([0,0,0])).to(eq("3 quarters 2 dimes 4 pennies"))
  end
  it('gives 2 quarters and 4 pennies when change is 54') do
    expect(54.coin_combinations([0,0,0])).to(eq("2 quarters 4 pennies"))
  end
  it('gives 2 quarters 2 dimes and two pennies when change is 72') do
    expect(72.coin_combinations([0,0,0])).to(eq("2 quarters 2 dimes 2 pennies"))
  end
  it('handles a larger change amount') do
    expect(200.coin_combinations([0,0,0])).to(eq("8 quarters"))
  end
  it('handles a very large change anount') do
    expect(5332.coin_combinations([0,0,0])).to(eq("213 quarters 1 nickel 2 pennies"))
  end
  it('handles a limited amount of quarters') do
    expect(100.coin_combinations([3,0,0])).to(eq("3 quarters 2 dimes 1 nickel"))
  end
  it('handles a limited amount of dimes') do
    expect(65.coin_combinations([1,3,0])).to(eq("1 quarter 3 dimes 2 nickels"))
  end
  it('handles a limited amount of nickles') do
    expect(465.coin_combinations([1,3,3])).to(eq("1 quarter 3 dimes 3 nickels 395 pennies"))
  end
end
