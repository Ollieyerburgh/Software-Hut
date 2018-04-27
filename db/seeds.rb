# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Config.locale = 'en-GB'

User.create(email:'fake@sheffield.ac.uk', password:'password', password_confirmation: 'password', id: '1', forename: 'isaac', surname: 'yerdburgh',  postcode: Faker::Address.postcode, )
Admin.where(email: 'admin1@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '1')


user = User.find_by_email("fake@sheffield.ac.uk")
10.times do
  user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: Faker::Address.postcode, link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address, status: 'pending')
end

subjects =  ['Maths', 'English', 'Physics', 'Geography', 'Computer Science']
subjects.each { |subject| Subject.first_or_create(name: subject)}

themes =  ['Careers', 'Employability', 'Higher Education', 'University', 'Study Skills']
themes.each { |theme| Theme.first_or_create(name: theme)}

deliveries =  ['In school/college', 'Out of school/college', 'Online']
deliveries.each { |delivery| Delivery.first_or_create(method: delivery)}
