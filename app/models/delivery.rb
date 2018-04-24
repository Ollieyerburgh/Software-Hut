# == Schema Information
#
# Table name: deliveries
#
#  id         :integer          not null, primary key
#  method     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Delivery < ApplicationRecord
  has_and_belongs_to_many :preferences
  validates :name, presence: false
  has_and_belongs_to_many :activities

end
