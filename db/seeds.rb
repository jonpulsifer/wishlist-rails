# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Rails.env.production?
  require 'faker'
  puts 'Seeding Families'
  Family.create!([
    { name: Faker::Name.unique.last_name, pin: 1337 },
    { name: Faker::Name.unique.last_name, pin: Faker::Number.unique.number(digits: 4) },
    { name: Faker::Name.unique.last_name, pin: Faker::Number.unique.number(digits: 4) },
  ])

  puts 'Seeding Users into Families'
  Family.find_each do |family|
    rand(3..10).times do
      pw = Faker::Internet.password
      user = User.new(
        name: Faker::TvShows::RickAndMorty.unique.character,
        password: pw,
        password_confirmation: pw,
        address: Faker::Address.full_address,
        shirt_size: rand(1..10),
        pant_size: rand(1..10),
        shoe_size: Faker::Number.within(range: 1..15),
        dress_size: rand(1..10),
      )
      user.families << family
      user.save!
    end
  end

  puts 'Seeding Gifts'
  User.find_each do |user|
    rand(3..15).times do
      gift = Gift.new(
        name: Faker::Game.title,
        notes: Faker::TvShows::RickAndMorty.quote,
        url: Faker::Internet.url(host: 'example.com'),
      )
      user.gifts << gift
      user.save!
    end
  end

  puts 'Seeding Claims'
  Family.find_each do |family|
    family.gifts.sample(10).each do |gift|
      user = family.users.where.not(id: gift.user.id).sample
      gift.update(claimed_by: user.id)
    end
  end
end
