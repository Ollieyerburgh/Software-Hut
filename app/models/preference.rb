# == Schema Information
#
# Table name: preferences
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  subject_id  :integer
#  theme_id    :integer
#  delivery_id :integer
#  proximity   :integer
#

class Preference < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :themes
  has_many :deliveries
  validates :theme_id, :delivery_id, presence: false
end
