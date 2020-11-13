# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Families'
Family.create!([
  { name: 'Griswold', pin: 1337 },
  { name: 'Parker', pin: 1338 },
])

puts 'Seeding Users'
User.create!([
  { name: 'alice', family: Family.first, password: 'lol', password_confirmation: 'lol' },
  { name: 'bob', family: Family.second, password: 'lol', password_confirmation: 'lol' },
  { name: 'carol', family: Family.second, password: 'lol', password_confirmation: 'lol' },
])

puts 'Seeding Gifts'
User.first.gifts.new(
  name: 'Snow Shovel',
  url: 'https://www.amazon.ca/gp/product/B01LXEQ6UM',
  notes: "I'm anticipating a lot of snow this year"
).save!

User.second.gifts.new(
  name: 'Fingerless Gloves',
  url: 'https://www.amazon.ca/dp/B0057XA2KS',
  notes: "I'm sort of against mittens, I also have small hands."
).save!

User.third.gifts.new(
  name: 'Knockoff Handbag',
  url: 'https://you.got.scammed.br',
  notes: 'ALL MY LINKS ARE FROM AMAZON.COM'
).save!

User.third.gifts.new(
  name: 'Fingerless Gloves',
  url: 'https://www.amazon.ca/dp/B0057XA2KS',
  notes: 'I want what Bob has!'
).save!
