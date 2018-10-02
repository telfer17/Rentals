require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/car.rb')
require_relative('../models/customer.rb')
require_relative('../models/rental.rb')
also_reload('../models/*' )

get '/rentals' do
  @rentals = Rental.all
  erb ( :"rentals/index" )
end

get '/rentals/new' do
  @cars = Car.all
  @customers = Customer.all
  erb (:"rentals/new")
end

post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  redirect to("/rentals")
end
