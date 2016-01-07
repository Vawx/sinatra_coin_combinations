require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the coin change path', {:type => :feature}) do
  it('processes the user input and returns thier change') do
    visit('/')
    fill_in('change', :with => "34")
    click_button('send')
    expect(page).to have_content("1 quarter 1 nickel 4 pennies")
  end
end
