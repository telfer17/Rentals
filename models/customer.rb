require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :first_name, :last_name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers
    (
      first_name,
      last_name,
      funds
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @funds]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE customers
    SET
    (
      first_name,
      last_name,
      funds
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@first_name, @last_name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
