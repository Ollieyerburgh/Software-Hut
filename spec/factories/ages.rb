# == Schema Information
#
# Table name: ages
#
#  id  :integer          not null, primary key
#  age :string
#

FactoryGirl.define do
  factory :age do
    age "9-11"

  end
end
