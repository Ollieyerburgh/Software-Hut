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
  validates :delivery_id, presence: false
end
