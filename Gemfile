source "http://rubygems.org"
ruby '2.3.1'
gem 'rails', '5.1.4'
gem 'responders'
gem 'activerecord-session_store', git: 'https://github.com/epigenesys/activerecord-session_store.git', branch: 'rails-5-generator'
gem 'thin'

gem 'sqlite3', group: [:development, :test]
gem 'dotenv-rails', groups: [:development, :test]
gem 'mail_form'

gem 'pg'

gem 'airbrake', git: 'https://github.com/epigenesys/airbrake.git', branch: 'airbrake-v4'
gem 'bootstrap-datepicker-rails'

gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'select2-rails'
gem 'epi_js'
gem 'acts_as_votable'
gem 'simple_form'
gem 'draper'
gem 'ransack', '~> 1.8.0'
gem "twitter-bootstrap-rails"
gem 'polyamorous', '~> 1.3.1'
gem 'underscore-rails'
gem 'dependent-fields-rails'
gem 'will_paginate', '~> 3.1.5'

gem 'devise'
gem 'devise_ldap_authenticatable'
gem 'devise_cas_authenticatable'
gem 'cancancan'
gem 'carrierwave', '~> 1.0'


gem 'sidekiq'
gem 'sinatra', require: false
gem 'whenever', require: false
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'delayed-plugins-airbrake'
gem 'daemons'

gem 'google-maps'
gem 'faker'
gem "jquery-slick-rails"
gem "shoulda"
gem 'test-unit'
gem 'google_maps_service'



group :development, :test do
  gem 'rspec-rails'
  gem 'byebug'
end

group :development do
  gem 'listen'
  gem 'web-console'
  gem 'spring'

  gem 'capistrano', '~> 3.4'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-passenger', require: false
  gem 'epi_deploy', git: 'https://github.com/epigenesys/epi_deploy.git'

  gem 'eventmachine'
  gem 'letter_opener'
  gem 'annotate'
end

group :test do
  gem 'capybara-select2', git: 'https://github.com/goodwill/capybara-select2.git'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'poltergeist'
  gem 'rspec-instafail', require: false
  gem 'capybara-bootstrap-datepicker'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov'
end
