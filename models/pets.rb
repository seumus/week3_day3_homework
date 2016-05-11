require('pg')
require_relative('../db/sql_runner.rb')
require_relative('pet_shops.rb')

class Pet

  attr_reader(:id)
  attr_accessor(:name,:pet_type,:store_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @pet_type = options['pet_type']
    @store_id = options['store_id'].to_i
  end

  def save()
    sql = "INSERT INTO pets (name,pet_type,store_id) VALUES ('#{@name}', '#{@pet_type}', '#{@store_id}') RETURNING *;"
    pet = SqlRunner.run(sql).first
    result = Pet.new(pet)
    return result
  end

  def self.all()
    sql = "SELECT * FROM pets;"
    pets = SqlRunner.run(sql)
    return pets.map {|pet| Pet.new(pet)}
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE pets SET name = '#{@name}', pet_type = '#{@pet_type}', store_id = '#{@store_id}'
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

end
