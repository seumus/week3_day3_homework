require('pg')
require_relative('../db/sql_runner.rb')
require_relative('pets.rb')


class PetShop

  attr_reader(:id)
  attr_accessor(:name,:address,:type)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO pet_shops (name,address,type) VALUES ('#{@name}', '#{@address}', '#{@type}') RETURNING *;"
    shop = SqlRunner.run(sql).first
    result = PetShop.new(shop)
    return result
  end

  def self.all()
    sql = "SELECT * FROM pet_shops;"
    pet_shops = SqlRunner.run(sql)
    return pet_shops.map {|shop| PetShop.new(shop)}
  end

  def update()
    sql = "UPDATE pet_shops SET name = '#{@name}', address = '#{@address}', type = '#{@type}'
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM pet_shops WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

end
