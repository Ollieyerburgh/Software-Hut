# == Schema Information
#
# Table name: addresses
#
#  id       :integer          not null, primary key
#  postcode :string
#  city     :string
#

class Address < ApplicationRecord
  belongs_to :user
end
