# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  preference_id :integer
#  activity_id   :integer
#
# Indexes
#
#  index_subjects_on_activity_id    (activity_id)
#  index_subjects_on_preference_id  (preference_id)
#
# Foreign Keys
#
#  fk_rails_...  (activity_id => activities.id)
#  fk_rails_...  (preference_id => preferences.id)
#

require 'rails_helper'

RSpec.describe Subject, type: :model do
  subject = FactoryGirl.create(:subject)

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe "Associations" do
    it { should have_and_belong_to_many(:preferences) }
    it { should have_and_belong_to_many(:activities) }
    it { should have_and_belong_to_many(:resources) }

  end
  
end