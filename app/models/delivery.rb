# == Schema Information
#
# Table name: deliveries
#
#  id     :integer          not null, primary key
#  method :string
#

#Deliveries are the ways in which activities are delivered ie. In school/ Online

class Delivery < ApplicationRecord
  has_and_belongs_to_many :preferences
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :resources
  validates :method, presence: true
end
