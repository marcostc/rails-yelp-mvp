# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants...'

categorys = %w(chinese italian japanese french belgian)

20.times do
  restaurant = Restaurant.create!(
  {
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: categorys.sample
  })
  p "Created #{restaurant.name}"
  5.times do
    Review.create!({
      content: Faker::Restaurant.review,
      rating: (1..5).to_a.sample,
      restaurant: restaurant
      })
  end
  puts '.  Also created 5 reviews for this restaurant.'
end
