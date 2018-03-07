# == Schema Information
#
# Table name: resources
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :string
#  email         :string
#  tags          :string
#  add_documents :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
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
