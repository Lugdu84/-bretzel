# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destroy all bikes"
Bike.destroy_all
puts "destroy all users"
User.destroy_all

users = []
address = %w[Peynier Aubagne Cassis Gémenos Napollon Peypin Roquevaire Auriol Allauch Cadolive Fuveau]

5.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    password: 'azertyss'
  )
  users << user
  puts "#{i + 1}. #{user.email}"
end
puts "Finished create users"

puts "creates bikes"
11.times do |i|
  velo = Bike.create!(
    name: Faker::Sports::Basketball.player,
    description:Faker::Lorem.paragraph ,
    price: rand(10..250),
    photo: "#{i}.jpg",
    user: users.sample,
    address: address[i]
  )
  puts "#{i + 1}. #{velo.name}"
end
puts "Finished creating bikes"

puts 'Finished!'

