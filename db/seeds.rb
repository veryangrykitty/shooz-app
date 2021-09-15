# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating 10 users"
letters = %w[a b c d e f g h i j]

letters.each do |letter|
  User.create(email: "#{letter}@gmail.com", password: "123123")
end

lastfiveusers = User.last(5)

lastfiveusers.each do |user|
  3.times do
    brand = %w[nike adidas newbalance airjordan reebok].sample
    modelname = %w[a1 a2 a3 a4 a5 b1 b2 b3 b4 b5 c1 c2 c3 c4 c5].sample
    size = %w[US6 US6.5 US7 US7.5 US8 US8.5 US9 US9.5 US10 US10.5 US11].sample
    price = rand(300)
    condition = %w[new used].sample
    availability = true
    listing = Listing.new(brand: brand, sneaker_model_name: modelname, size: size, price: price, condition: condition, availability: availability)
    listing.seller = user
    listing.save
    puts "listing created"
  end
end
