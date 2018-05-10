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
    factory :age1 do
      age "10-12"
    end
  end
end
