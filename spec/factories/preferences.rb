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

FactoryGirl.define do
  factory :preference do
    preference_id 1
  end
end
