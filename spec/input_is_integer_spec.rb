require('rspec')
require('input_is_integer')

describe("String#input_is_integer") do
  it("return true if input is a integer value") do
    expect("3".input_is_integer).to(eq(true))
  end
  it("returns false if input is not a interger value") do
    expect("kyle".input_is_integer).to(eq(false))
  end
end
