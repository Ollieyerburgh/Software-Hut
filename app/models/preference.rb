# == Schema Information
#
# Table name: preferences
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#
# Indexes
#
#  index_preferences_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#

class Preference < ApplicationRecord
  has_many :subjects
  has_many :themes
  has_many :deliveries
  #accepts_nested_attributes_for :subjects
end
