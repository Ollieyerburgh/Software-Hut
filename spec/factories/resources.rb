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
