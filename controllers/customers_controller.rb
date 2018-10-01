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
  erb(:"customers/new")
end

post '/customers' do
  customer = Customer.new(params)
  customer.save()
  redirect to("/customers")
end

post '/customers/:id/delete' do
  Customer.delete(params[:id])
  redirect to("/customers")
end
