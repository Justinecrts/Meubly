# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

users_attributes = [
  {
    email:         "test@gmail.com",
    password:      "salutsalut",
    first_name:    "Quentin",
    last_name:     "Casaubon",
    phone_number:  "0678787878",
    address:       "12 rue gare de Lyon",
    image_url:     "www.google.com"
  },
  {
    email:         "test2@gmail.com",
    password:      "salutsalut",
    first_name:    "Hugues",
    last_name:     "Thomas",
    phone_number:  "0678787878",
    address:       "18 rue montorgueil",
    image_url:     "www.google.com"
  },
  {
    email:         "test3@gmail.com",
    password:      "salutsalut",
    first_name:    "Justine",
    last_name:     "Courtois",
    phone_number:  "0678787878",
    address:       "11 rue Oberkampf",
    image_url:     "www.google.com"
  }
]

users_attributes.each { |params| User.create!(params) }
