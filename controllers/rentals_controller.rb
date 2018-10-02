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
  rental.save
  car = Car.find(params[:car_id])
  car.rent_car
  redirect ("/rentals")
end

post '/rentals/:id/delete' do
  rental = Rental.find(params[:id])
  car = rental.car
  car.return_car
  Rental.delete(rental.id)
  redirect '/rentals'
end
