# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  title       :string
#  link        :string
#  description :string
#  status      :string           default("pending")
#  email       :string
#  user_id     :integer
#  subject_id  :integer
#  file        :string
#
# Indexes
#
#  index_resources_on_subject_id  (subject_id)
#  index_resources_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryGirl.define do
  factory :resource do
    before(:create) do |resource|
      create(:user1)
    end
    title "test"
    description "MyString"
    email "resourcetest2@test.com"
    status "pending"

    factory :resource_approved do
      title "test"
      description "test-resource"
      email "testing2@test.com"
      status "approved"
      user_id "1"
    end
  end
end
