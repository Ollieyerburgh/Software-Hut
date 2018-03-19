# == Schema Information
#
# Table name: events NEED TO CHANGE
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
  factory :activity do
    title "MyString"
    description "MyString"
    start_date "2018-02-27"
    end_date "2018-02-27"
    link "MyString"
  end
end
