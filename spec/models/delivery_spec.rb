# == Schema Information
#
# Table name: deliveries
#
#  id     :integer          not null, primary key
#  method :string
#

require 'rails_helper'

RSpec.describe Delivery, type: :model do

  describe "Associations" do
    it { should have_and_belong_to_many(:activities) }
    it { should have_and_belong_to_many(:preferences) }
  end

end
