# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Config.locale = 'en-GB'

User.where(email: 'fake@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '1')
User.where(email: 'fake1@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '2')
User.where(email: 'fake2@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '3')
User.where(email: 'fake3@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '4')
User.where(email: 'fake4@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '5', forename: 'ollie', surname: 'yerburgh')
User.where(email: 'Anonymous@fake.com').first_or_create(password:'AFDD43dsnj5', password_confirmation: 'AFDD43dsnj5', id: '100000', forename: 'Anonymous', surname: 'Anonymous', postcode: 'S102SQ')

Admin.where(email: 'admin1@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '1')



user = User.find_by_email("fake@sheffield.ac.uk")
100.times do
  user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: Faker::Address.postcode, link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address)
  user.resources.create(title: Faker::Name.unique.name, link: Faker::Internet.url, description: Faker::Company.bs, status: "active", email: Faker::Internet.email)
end

subjects =  ['maths', 'english', 'physics', 'geography', 'computer science']
subjects.each { |subject| Subject.create(name: subject)}
