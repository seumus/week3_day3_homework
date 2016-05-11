require_relative('./models/pets.rb')
require_relative('./models/pet_shops.rb')

require('pry-byebug')

pet_shop1 = PetShop.new('name' => 'Fish R Us', 'address' => '5 bigstreet', 'type' => 'exotic fish').save()
pet1 = Pet.new('name' => 'Nemo', 'pet_type' => 'clown fish', 'store_id' => pet_shop1.id).save()
pet_shop2 = PetShop.new('name' => 'Fish R Us', 'address' => 'Road', 'type' => 'cows').save()
pet2 = Pet.new('name' => 'Cowy', 'pet_type' => 'cow', 'store_id' => pet_shop2.id).save()

PetShop.all
PetShop.all[1]
pet_shop2.name = "Cows R Us"
pet_shop2.update
pet2.pet_type = "Bull"
pet2.update

pet1.delete
pet_shop1.delete

binding.pry
nil
