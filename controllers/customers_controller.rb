require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer.rb')
also_reload('../models/*')

get '/customers' do
  @customers = Customer.all()
  erb (:"customers/index")
end

get '/customers/new' do
  @customers = Customer.all
  erb (:"customers/new")
end

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb (:"customers/edit")
end

post '/customers/:id' do
  @customers = Customer.new(params)
  @customers.update()
  redirect ("/customers")
end

post '/customers' do
  customer = Customer.new(params)
  customer.save()
  redirect ("/customers")
end

post '/customers/:id/delete' do
  #find all cars currently rented by customer
  #loop through that array of cars
  #set the availability of each car back to available
  #update the car in the database
  customer = Customer.find(params[:id])
  cars = customer.find_car()
  for car in cars
    car.return_car()
  end
  customer.delete()
  redirect ("/customers")
end
