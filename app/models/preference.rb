# == Schema Information
#
# Table name: preferences
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#

class Preference < ApplicationRecord
  #has_many :subjects
  belongs_to :subject
  has_many :themes
  has_many :deliveries
  #accepts_nested_attributes_for :subjects
  validates :subject_id, presence: true
end
