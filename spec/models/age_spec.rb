# == Schema Information
#
# Table name: ages
#
#  id  :integer          not null, primary key
#  age :string
#

require 'rails_helper'

RSpec.describe Age, type: :model do
  describe "Associations" do
    it { should have_and_belong_to_many(:activities) }
    it { should have_and_belong_to_many(:preferences) }
  end
end
