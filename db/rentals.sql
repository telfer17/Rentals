DROP TABLE rentals;
DROP TABLE cars;
DROP TABLE customers;

CREATE TABLE cars
(
  id SERIAL4 primary key,
  make VARCHAR(255),
  features VARCHAR(255),
  status VARCHAR(255),
  image VARCHAR(255)
);

CREATE TABLE customers
(
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE rentals
(
  id SERIAL4 primary key,
  car_id INT4 references cars(id),
  customer_id INT4 references customers(id)
);
