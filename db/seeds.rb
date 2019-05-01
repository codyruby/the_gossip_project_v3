# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# 10.times do 
#     u = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, email: Faker::Internet.email, age: Faker::Number.between(12, 99), city_id: Faker::Number.between(1, 10))
# end

# 10.times do 
#     c = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
# end

# users = User.all
# users.each_with_index do |city, index|
#     user = users.find(index + 1)
#     user.city_id = index + 1
#     user.save
# end

# 20.times do 
#     g = Gossip.create!(title: Faker::Lorem.word, content: Faker::Lorem.paragraph, user_id: Faker::Number.between(1, 10))
# end