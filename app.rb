require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/cars_controller')
require_relative('controllers/customers_controller')
require_relative('controllers/rentals_controller')
require('pry')
also_reload('./models/*')

get '/' do
  erb(:home)
end
