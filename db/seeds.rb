# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

10.times do
  offer = Offer.new(
    name: Faker::StarWars.character,
    image_url: Faker::Company.logo,
    description: Faker::Team.name,
    price: rand(1...50),
    address: Faker::Address.street_name,
    category: Faker::Beer.hop,
    user_id: 1)
  offer.save
end
