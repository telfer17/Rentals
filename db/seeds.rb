require_relative( "../models/car.rb" )
require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require('pry')

Rental.delete_all()
Customer.delete_all()
Car.delete_all()

car1 = Car.new({
  "make" => "BMW",
  "features" => "Automatic gearbox",
  "image" => "/images/bmw.jpg"
  })

car2 = Car.new({
  "make" => "Skoda",
  "features" => "Parking sensors",
  "image" => "/images/skoda.jpg"
  })

car3 = Car.new({
  "make" => "Van",
  "features" => "Excellent storage space",
  "image" => "/images/van.jpg"
  })

car4 = Car.new({
  "make" => "Vauxhall",
  "features" => "Automatic gearbox",
  "image" => "/images/vauxhall.jpg"
  })

car1.save()
car2.save()
car3.save()
car4.save()

customer1 = Customer.new({
  "first_name" => "David",
  "last_name" => "Telfer"
  })

customer2 = Customer.new({
  "first_name" => "Daniel",
  "last_name" => "Smith"
  })

customer3 = Customer.new({
  "first_name" => "John",
  "last_name" => "Jackson"
  })

customer4 = Customer.new({
  "first_name" => "Jack",
  "last_name" => "Wilson"
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()

rental1 = Rental.new({
  "car_id" => car1.id,
  "customer_id" => customer1.id
})

rental2 = Rental.new({
  "car_id" => car2.id,
  "customer_id" => customer2.id
})

rental3 = Rental.new({
  "car_id" => car3.id,
  "customer_id" => customer3.id
})

rental4 = Rental.new({
  "car_id" => car4.id,
  "customer_id" => customer4.id
})

rental1.save()
rental2.save()
rental3.save()
rental4.save()

binding.pry
nil
