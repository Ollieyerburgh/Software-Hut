# == Schema Information
#
# Table name: addresses
#
#  id       :integer          not null, primary key
#  postcode :string
#  city     :string
#  user_id  :integer
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :address do
    
  end
end
