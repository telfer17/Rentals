require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/car.rb')
also_reload('../models/*')

get '/cars' do
  @cars = Car.all()
  erb (:"cars/index")
end

get '/cars/new' do
  @cars = Car.all
  erb(:"cars/new_car")
end

post '/cars' do
  car = Car.new(params)
  car.save()
  redirect to("/cars")
end

post '/cars/:id/delete' do
  Car.delete(params[:id])
  redirect to("/cars")
end
