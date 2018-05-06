# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Faker::Config.locale = 'en-GB'

subjects =  ['Maths', 'English', 'Physics', 'Geography', 'Computer Science']
subjects.each { |subject| Subject.create(name: subject)}

themes =  ['Careers', 'Employability', 'Higher Education', 'University',
  'Apprenticeship', 'Work-Related Learning', 'Subject Knowledge, Enrichement',
  'Confidence/Aspriation', 'Citizenship', 'Health & Wellbeing', 'Study Skills',
  'Soft Skills']
themes.each { |theme| Theme.create(name: theme)}

deliveries =  ['In school/college', 'Out of school/college', 'Online']
deliveries.each { |delivery| Delivery.create(method: delivery)}


ages = ['11-14', '14-16', '16-19', '19+']
ages.each {|age| Age.create(age: age)}

User.create(email:'fake@sheffield.ac.uk', password:'password', password_confirmation: 'password', id: '20', forename: 'isaac', surname: 'yerdburgh',  postcode: Faker::Address.postcode, )
Admin.where(email: 'admin1@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '1')

user = User.find_by_email("fake@sheffield.ac.uk")

user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: 's12dw', link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address, status: 'approved', theme_ids: [1,2], subject_ids: [1,5], delivery_ids: [1], age_ids: [1])
user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: 's37hb', link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address, status: 'approved', theme_ids: [1,2], subject_ids: [1,5], delivery_ids: [1], age_ids: [1])
user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: 'gl103qx' , link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address, status: 'approved', theme_ids: [1,2], subject_ids: [1,5], delivery_ids: [1], age_ids: [1])



#user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: Faker::Address.postcode, link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address, status: 'approved', theme_ids: [1,3], subject_ids: [3,5], delivery_ids: [2,1], age_ids: [1])
#user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: Faker::Address.postcode, link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address, status: 'approved', theme_ids: [2,5], subject_ids: [1], delivery_ids: [], age_ids: [])

#10.times do
#  user.activities.create(title: Faker::Name.title, description: Faker::Company.bs, start_date: '01/13/2019', end_date: '02/13/2019', deadline: '01/13/2019', postcode: Faker::Address.postcode,
#    link: Faker::Internet.url, email: Faker::Internet.email, address: Faker::Address.street_address, status: 'approved', subject_ids: [1,2], theme_ids: [3,4], delivery_ids: [1], age_ids: [1])
#  user.resources.create(title: Faker::Name.unique.name, link: Faker::Internet.url, description: Faker::Company.bs, email: Faker::Internet.email, status: 'pending')
#end
