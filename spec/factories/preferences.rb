# == Schema Information
#
# Table name: preferences
#
#  id            :integer          not null, primary key
#  preference_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  subject_id    :integer
#
# Indexes
#
#  index_preferences_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#

FactoryGirl.define do
  factory :preference do
    preference_id 1
  end
end
