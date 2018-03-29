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
#
# Indexes
#
#  index_activities_on_tag_id  (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#

FactoryGirl.define do
  factory :activity do
    title "MyString"
    description "MyString"
    start_date "2018-02-27"
    end_date "2018-02-27"
    link "MyString"
  end
end
