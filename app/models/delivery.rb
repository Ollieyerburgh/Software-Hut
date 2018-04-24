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
<<<<<<< HEAD
  validates :method, presence: false
=======
  has_and_belongs_to_many :activities

  validates :delivery_id, presence: false
>>>>>>> e837aec1345a73afbc528b5e62ce4274116ba76a
end
