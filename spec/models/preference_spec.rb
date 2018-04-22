# == Schema Information
#
# Table name: preferences
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  subject_id  :integer
#  theme_id    :integer
#  delivery_id :integer
#  proximity   :integer
#

require 'rails_helper'

RSpec.describe Preference, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe "Associations" do
  it { should have_and_belong_to_many(:subjects) }
  it { should have_and_belong_to_many(:activities) }
  it { should have_many(:themes }
  it { should have_many(:deliveries }
end