# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  breed =         Faker::Cat.breed
  dob =           Faker::Date.backward(365)
  description =   Faker::Lorem.paragraph
  price =         Faker::Commerce.price(500.00..5000.00)
  quantity =      Faker::Number.between(1,5)
  gender =        Faker::Number.between(0,1)
  Product.create(breed: breed, dob: dob, description: description, price: price, quantity: quantity, gender: gender)
end


5.times do
  firstname =         Faker::Name.first_name
  lastname =          Faker::Name.last_name
  username =          Faker::Internet.user_name
  telephone_number =  Faker::PhoneNumber.cell_phone
  address =           Faker::Address.street_address
  email =             Faker::Internet.email
  password =          123456
  User.create(firstname: firstname, lastname: lastname, username: username, telephone_number: telephone_number, address: address, email: email, password: password)
end

for i in (1..5)
  LineItem.create(shopping_cart: ShoppingCart.find(i), product: Product.find(i), quantity: 1)
end

for i in (1..5)
  Order.create(user: User.find(i), orderstatus: 0)
end
