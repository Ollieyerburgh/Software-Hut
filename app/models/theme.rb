# == Schema Information
#
# Table name: themes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Theme < ApplicationRecord
  has_and_belongs_to_many :preferences
  has_and_belongs_to_many :activities
  validates :name, presence: true
end
