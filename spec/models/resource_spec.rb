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
#  resources   :json
#  user_id     :integer
#  subject_id  :integer
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
  FactoryGirl.create(:user)
  resource = FactoryGirl.create(:resource)

  it "is valid with valid attributes" do
    expect(resource).to be_valid
  end

  it "is not valid without title" do
    resource.title = nil
    expect(resource).to_not be_valid

  end

  it "is not valid without description" do
    resource.description = nil
    expect(resource).to_not be_valid
  end

  it "is not valid without link" do
    resource.link = nil
    expect(resource).to_not be_valid
  end
end
