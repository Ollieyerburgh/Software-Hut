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
#  resources   :json
#  user_id     :integer
#
# Indexes
#
#  index_resources_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryGirl.define do
  factory :resource do
    name "MyString"
    description "MyString"
    email "MyString"
    tags "MyString"
    add_documents "MyString"
     "MyString"
  end
end
