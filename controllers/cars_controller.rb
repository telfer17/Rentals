require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/car.rb')
also_reload('../models/*')

get '/cars' do
  @cars = Car.all()
  erb ( :"cars/index" )
end
