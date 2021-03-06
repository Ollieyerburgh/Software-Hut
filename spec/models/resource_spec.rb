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
#  user_id     :integer
#  subject_id  :integer
#  file        :string
#
# Indexes
#
#  index_resources_on_subject_id  (subject_id)
#  index_resources_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Resource, type: :model do
  resource = FactoryGirl.create(:resource)

  it "is valid with valid attributes" do
    expect(resource).to be_valid
  end

  it "is not valid without title" do
    resource.title = nil
    expect(resource).to_not be_valid
    resource.title = "test"
  end

  it "is not valid without description" do
    resource.description = nil
    expect(resource).to_not be_valid
    resource.description = "blah"
  end

  it "is not valid without email" do
    resource.email = nil
    expect(resource).to_not be_valid
    resource.email = "test@test.com"

  describe "Associations" do
    it { should have_and_belong_to_many(:subjects) }
    it { should belong_to(:user) }
  end

end
