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
#

class Preference < ApplicationRecord
  belongs_to :subject
  has_and_belongs_to_many :subjects
  #belongs_to :theme
  #belongs_to :delivery
  validates :theme_id, :delivery_id, presence: false
end
