# == Schema Information
#
# Table name: preferences
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  subject_id  :integer
#  theme_id    :integer
#  delivery_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_preferences_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#

#FactoryGirl.define do
#    user = User.create(email:'jkshdjak@gmail.com', password: 'password', password_confirmation: 'password', forename: 'anon', surname: 'anon', postcode: "rg45 8nd")
#
#    factory :preference do
#        proximity 1000
#        user user
#    end
#  end
