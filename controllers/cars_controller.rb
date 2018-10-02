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

  file = params[:image][:tempfile]

  File.open("./public/images/#{params[:image][:filename]}", 'wb') do |f|
    f.write(file.read)
  end

  car.image = params[:image][:filename]
  car.save()
  redirect to("/cars")
end

post '/cars/:id/delete' do
  Car.delete(params[:id])
  redirect to("/cars")
end
