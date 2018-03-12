# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :string
#  startdate      :date
#  enddate        :date
#  url            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  location       :string
#  tags           :string
#  add_documents  :string
#  email          :string
#  deadlinedate   :date
#  eligability    :string
#  capacity       :integer
#  request_status :string           default("Pending")
#

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyString"
    startdate "2018-02-27"
    enddate "2018-02-27"
    url "MyString"
  end
end
