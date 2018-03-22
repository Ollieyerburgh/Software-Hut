# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.where(email: 'fake@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '1')
User.where(email: 'fake1@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '2')
User.where(email: 'fake2@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '3')
User.where(email: 'fake3@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '4')
User.where(email: 'fake4@sheffield.ac.uk').first_or_create(password:'password', password_confirmation: 'password', id: '5', forename: 'ollie', surname: 'yerburgh')

Activity.create(title: 'Test', description: 'Test description', start_date: '01/02/01', end_date: '01/02/02', deadline: '01/02/03', postcode: "S102SQ", link: 'www.facebook.com', email: 'Fake@sheffield.ac.uk', address: '19, Kingscote, Glos')
