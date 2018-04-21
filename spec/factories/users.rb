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
    email {'test@test.com'}
    forename {'test'}
    surname {'test'}
    postcode {'S102SQ'}
    password {'password'}

  end
end
