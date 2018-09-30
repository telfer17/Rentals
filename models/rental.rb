require_relative( '../db/sql_runner' )

class Rental

  attr_reader :id, :car_id, :customer_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @car_id = options['car_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
    (
      car_id,
      customer_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@car_id, @customer_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |rental| Rental.new(rental) }
  end

  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

end
