# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  preference_id :integer
#
# Indexes
#
#  index_subjects_on_preference_id  (preference_id)
#
# Foreign Keys
#
#  fk_rails_...  (preference_id => preferences.id)
#

FactoryGirl.define do
  factory :subject do
    name "MyString"
  end
end
