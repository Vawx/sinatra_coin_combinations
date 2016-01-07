require('sinatra')
require('sinatra/reloader')
require('./lib/coin_combinations')
require('./lib/input_is_integer')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/change') do
  @input_change_string = params.fetch('change')
  if @input_change_string.input_is_integer
    @convert_change = @input_change_string.to_i
    @register_quarters = params.fetch('register_quarters')
    @register_dimes = params.fetch('register_dimes')
    @register_nickles = params.fetch('register_nickles')
    @register_coins = Array.new
    @register_coins.push(@register_quarters.to_i)
    @register_coins.push(@register_dimes.to_i)
    @register_coins.push(@register_nickles.to_i)

    @change = @convert_change.coin_combinations( @register_coins )
  else
    @change = "Invalid input! Please try again..."
  end
  erb(:change)
end
