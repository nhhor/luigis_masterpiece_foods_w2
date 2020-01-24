# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


product_array = []
Product.destroy_all
35.times do |index|
  product_array <<  Product.create!(name: Faker::Food.unique.ingredient, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: Faker::Address.country)
end
15.times do |index|
  product_array <<  Product.create!(name: Faker::Food.unique.ingredient, cost: Faker::Number.decimal(l_digits: 2), country_of_origin: "USA")
end
p "Created #{Product.count} products."

Review.destroy_all
product_array.each do |product|
  (1..5).each do |num|
    Review.create!(author: Faker::Name.name, content_body: Faker::Lorem.paragraph_by_chars(number: 128, supplemental: false), rating: Faker::Number.between(from: 1, to: 5), product_id: product.id)
  end
end
p "Created #{Review.count} reviews."
