# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Users"
alice = User.new(name: "alice", password: 'lol', password_confirmation: 'lol')
bob = User.new(name: "bob", password: 'lol', password_confirmation: 'lol')
carol = User.new(name: "carol", password: 'lol', password_confirmation: 'lol')
alice.save!
bob.save!
carol.save!

puts "Seeding Wishlists"
alice.build_wishlist(name: "Christmas 2018").save!
bob.build_wishlist(name: "Rockin' Christmas").save!
carol.build_wishlist(name: "Spoiled Rotten").save!


puts "Seeding Gifts"
alice.wishlist.gifts.new(name: "Snow Shovel", url: "https://www.amazon.ca/gp/product/B01LXEQ6UM").save!
bob.wishlist.gifts.new(name: "Fingerless Gloves", url: "https://www.amazon.ca/dp/B0057XA2KS").save!
carol.wishlist.gifts.new(name: "Knockoff Handbag", url: "https://you.got.scammed.br").save!
carol.wishlist.gifts.new(name: "Fingerless Gloves", url: "https://www.amazon.ca/dp/B0057XA2KS").save!
