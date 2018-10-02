require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/car.rb')
require_relative('../models/customer.rb')
require_relative('../models/rental.rb')
also_reload('../models/*' )

get '/rentals' do
  @cars = Car.all
  @customers = Customer.all
  erb (:"rentals/index")
end
