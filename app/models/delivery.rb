# == Schema Information
#
# Table name: deliveries
#
#  id     :integer          not null, primary key
#  method :string
#

class Delivery < ApplicationRecord
  has_and_belongs_to_many :preferences
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :resources
  validates :method, presence: true
end
