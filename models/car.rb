require_relative('../db/sql_runner')

class Car

  attr_reader :id
  attr_accessor :make, :features, :status, :image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @make = options['make']
    @features = options['features']
    @status = options['status'].upcase
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO cars
    (
      make,
      features,
      status,
      image
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@make, @features, @status, @image]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM cars"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |car| Car.new(car) }
  end

  def self.find(id)
    sql = "SELECT * FROM cars
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Car.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM cars"
    SqlRunner.run(sql)
  end

  def rent_car()
    sql = "UPDATE cars SET status = 'rented' WHERE id = $1"
    values = [@id]
    updated_status = SqlRunner.run(sql, values)
  end

  def return_car(id)
    sql = "UPDATE cars SET status = 'available' WHERE id = $1"
    values = [@id]
    updated_status = SqlRunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM cars
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
