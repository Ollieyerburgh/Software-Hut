# == Schema Information
#
# Table name: themes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Theme, type: :model do
  #preference = FactoryGirl.create(:preference)

  describe "Associations" do
    it { should have_and_belong_to_many(:preferences) }
    it { should have_and_belong_to_many(:activities) }
  end

end