# == Schema Information
#
# Table name: activities
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  start_date              :string
#  end_date                :string
#  start_time              :string
#  end_time                :string
#  deadline                :string
#  postcode                :string
#  address                 :string
#  eligibility_criteria    :string
#  capacity                :integer
#  link                    :string
#  email                   :string
#  status                  :string           default("pending")
#  tag_id                  :integer
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  user_id                 :integer
#  subject_id              :integer
#
# Indexes
#
#  index_activities_on_subject_id  (subject_id)
#  index_activities_on_tag_id      (tag_id)
#  index_activities_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Activity, type: :model do
  FactoryGirl.create(:user)
  activity = FactoryGirl.create(:activity)

  it "is valid with valid attributes" do
    expect(activity).to be_valid
  end

  it "is not valid without title" do
    activity.title = nil
    expect(activity).to_not be_valid

  end

  it "is not valid without description" do
    activity.description = nil
    expect(activity).to_not be_valid
  end

  it "is not valid without start date" do
    activity.start_date = nil
    expect(activity).to_not be_valid
  end
  it "is not valid without end date" do
    activity.end_date = nil
    expect(activity).to_not be_valid
  end
  it "is not valid without deadline date" do
    activity.deadline = nil
    expect(activity).to_not be_valid
  end

  it "is not valid without email" do
    activity.email = nil
    expect(activity).to_not be_valid
  end

  it "is not valid without postcode" do
    activity.postcode = nil
    expect(activity).to_not be_valid
  end

  describe "Associations" do
    it { should have_and_belong_to_many(:subjects) }
    it { should have_and_belong_to_many(:themes) }
    it { should belong_to(:user) }

  end

end
