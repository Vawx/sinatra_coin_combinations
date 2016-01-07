require('rspec')
require('coin_combinations')

describe('Fixnum#coin_combinations') do
  it('gives pennies when change is less than 5 cents') do
    expect(3.coin_combinations).to( eq("3 pennies"))
  end
end
