# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  forename               :string
#  surname                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  address_id             :integer
#  postcode               :string
#
# Indexes
#
#  index_users_on_address_id            (address_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

  FactoryGirl.define do


  factory :user do
<<<<<<< HEAD
    email "ollieyerburgh@test.com"
    forename "test"
    surname "test"
    password "foobar"
    password_confirmation "foobar"
    postcode "S102SQ"
    id "1"


    factory :user1 do
      email "ollieyerburgh@test1.com"
      forename "test"
      surname "test"
      password "foobar"
      password_confirmation "foobar"
      postcode "S102SQ"
      id "2"
    end
    factory :user_anon do
      email "test@test.com"
      forename "test"
      surname "test"
      password "password"
      password_confirmation "password"
      postcode "s102sq"
      id "100000"
    end
=======
    email {'test@test.com'}
    forename {'test'}
    surname {'test'}
    postcode {'S102SQ'}
    password {'password'}
    id {'1'}
>>>>>>> 90d225963914bbe973e2aa63daf567fa11b6fa11
  end


end
