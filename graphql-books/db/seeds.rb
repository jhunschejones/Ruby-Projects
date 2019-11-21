# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# https://github.com/faker-ruby/faker
require 'faker'

5.times do
  User.create(
    name: Faker::FunnyName.name,
    email: Faker::Internet.email
  )

  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    published_year: Faker::Date.between_except(from: 30.years.ago, to: 1.year.from_now, excepted: Date.today).year,
    user_id: User.last.id
  )
end

5.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    published_year: Faker::Date.between_except(from: 30.years.ago, to: 1.year.from_now, excepted: Date.today).year,
    user_id: User.first.id
  )
end
