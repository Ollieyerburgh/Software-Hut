# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  preference_id :integer
#  activity_id   :integer
#
# Indexes
#
#  index_subjects_on_activity_id    (activity_id)
#  index_subjects_on_preference_id  (preference_id)
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#  fk_rails_...  (preference_id => preferences.id)
#

class Subject < ApplicationRecord
  #belongs_to :preference
  #attr_accessible :name
  has_many :activities
  has_many :resources
  validates :name, presence: true

end
