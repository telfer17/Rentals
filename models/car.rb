require_relative('../db/sql_runner')

class Car

  attr_reader :id
  attr_accessor :make, :features, :image

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @make = options['make']
    @features = options['features']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO cars
    (
      make,
      features,
      image
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@make, @features, @image]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM cars"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM cars
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
