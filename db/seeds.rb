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

lastfiveusers = User.last(7)
i = 1
lastfiveusers.each do |user|
  3.times do
    brand = %w[nike adidas newbalance airjordan reebok].sample
    modelname = %w[a1 a2 a3 a4 a5 b1 b2 b3 b4 b5 c1 c2 c3 c4 c5].sample
    size = %w[US6 US6.5 US7 US7.5 US8 US8.5 US9 US9.5 US10 US10.5 US11].sample
    price_cents = rand(30000)
    condition = %w[new used].sample
    availability = true
    gender = %w[male female unisex].sample
    listing = Listing.new(brand: brand, sneaker_model_name: modelname, size: size, price_cents: price_cents, condition: condition, availability: availability, gender: gender)
    # url = %w[ogr6ifvcuhjttn473eijtcatonwh mhjjyi2pwvqeeml0dozykd2md9nf no4lz5eyjpf7zd85uhv1c7al5jqi b86q12b9d7wqz9k2jqnonle15ava wvlf4rq27ms9w9mqp6ulrfqwbr83 0z2hrl7p9kmc3i0nj1xhxgc5strt z4zn0vph0odxkqph90sbrtfebd9u qk6bg1d61lv2jfygziper1hh0wu8 1vpmi4iudvk547szlefa3iyaac7t tbpggyj83wdt07uobpv6z5htl99g]
    # listing.photos.first.key = 'jffr7hnjkham7hl7naxfspu3quc6'

    # listing.photos.attach(
    #   io: File.open("development/ogr6ifvcuhjttn473eijtcatonwh"),
    #   filename: 'file.png'
    # )

    listing.photos.attach(io: File.open("app/assets/images/#{i}.png"), filename: "#{i}.png")
    listing.seller = user
    listing.save
    puts "listing created"
    i += 1
  end
end
