# == Schema Information
#
# Table name: themes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


#Themes are the type of events ie. For 1st years/ For careers etc.

class Theme < ApplicationRecord
  has_and_belongs_to_many :preferences
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :resources
  validates :name, presence: true
end
