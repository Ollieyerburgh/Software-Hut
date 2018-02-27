# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  startdate   :date
#  enddate     :date
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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
