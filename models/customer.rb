require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO customers
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def full_name()
    return "#{@first_name} #{@last_name}"
  end

  def update()
    sql = "UPDATE customers
    SET
    (
      first_name,
      last_name
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer) }
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def find_cars
    sql = ""
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
