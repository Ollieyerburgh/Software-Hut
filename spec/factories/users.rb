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
#  postcode               :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  role                   :string
#  school                 :string
#  dob                    :string
#  answer                 :string
#  organisation           :string
#  studyyear              :string
#  associatedschool       :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

  FactoryGirl.define do

    factory :user do
      email "ollieyerburgh@test.com"
      forename "test"
      surname "test"
      password "foobar12"
      password_confirmation "foobar12"
      postcode "GL8 8XY"
      answer "hello"



      factory :user1 do
        email "ollieyerburgh@test1.com"
        forename "test"
        surname "test"
        password "foobar12"
        password_confirmation "foobar12"
        postcode "EX226UY"
        answer "hello"
      end


      factory :user_anon do
        email "test@test.com"
        forename "test"
        surname "test"
        password "password"
        password_confirmation "password"
        postcode "s10 2sq"
        answer "hello"
      end
    end

  end
