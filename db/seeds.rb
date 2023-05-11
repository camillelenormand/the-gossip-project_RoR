# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


100.times do 
cities = City.create!([{ name: Faker::Address.city, zip_code: Faker::Address.zip_code }])
end

puts "Cities created!"

100.times do
  users = User.create!([{ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.between(from: 7, to: 77), description: Faker::Lorem.sentences(number: 1), email: Faker::Internet.email, city_id: Faker::Number.between(from: 1, to: 100) }])
end

puts "Users created!"

100.times do
    gossips = Gossip.create!([{ title: Faker::Lorem.characters(number: 10), content: Faker::Lorem.sentences(number: 1), user_id: Faker::Number.between(from: 1, to: 100) }])
end

puts "Gossips created!"

100.times do
  tags = Tag.create!([{ title: Faker::Lorem.characters(number: 10) }])
end

puts "Tags created!"

100.times do
  tags = JoinTableGossipTag.create!([{ tag_id: Faker::Number.between(from: 1, to: 100) , gossip_id: Faker::Number.between(from: 1, to: 100) }])
end

puts "JoinTableGossipTag items created!"

100.times do
  table = PrivateMessage.create!([{ sender_id: Faker::Number.between(from: 1, to: 100) , content: Faker::Lorem.sentences(number: 3) }])
end

puts "Private Messages created!"

100.times do
   recipients = Recipient.create!([{ user_id: Faker::Number.between(from: 1, to: 100) , private_message_id: Faker::Number.between(from: 1, to: 100) }])
end

puts "Recipients created!"