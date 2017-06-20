# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Product.create([{
    breed:        Faker::Cat.breed,
    dob:          Faker::Date.backward(365),
    description:  Faker::Lorem.paragraph,
    price:        Faker::Commerce.price,
    quantity:     Faker::Number.between(1,5)
  }])
end
