require('sinatra')
require('sinatra/reloader')
require('./lib/coin_combinations')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/change') do
  @input_change_string = params.fetch('change')
  @convert_change = @input_change_string.to_i
  @change = @convert_change.coin_combinations()
  erb(:change)
end
