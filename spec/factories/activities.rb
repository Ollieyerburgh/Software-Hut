# == Schema Information
#
# Table name: activities
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  start_date              :datetime
#  end_date                :datetime
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

FactoryGirl.define do
  factory :activity do
    before(:create) do |activity|
      create(:user)
    end
    title "test-title"
    description "test"
    start_date "01/01/2010"
    end_date "02/01/201"
    deadline "01/01/2010"
    postcode "S102SQ"
    link "www.facebook.com"
    email "test@test.com"
    status "pending"
    user_id "1"

    factory :activity_approved do
      title "test-title"
      description "test"
      start_date "01/01/2010"
      end_date "01/01/2010"
      deadline "01/01/2010"
      postcode "S102SQ"
      link "www.facebook.com"
      email "test@test.com"
      status "approved"
      user_id "1"
    end

    factory :activity_subject do
      title 'test-subject'
      description 'testing subject search'
      start_date "01/01/2010"
      end_date "01/02/2011"
      deadline "01/02/2010"
      link "www.google.com"
      email "testingsubjects@test.com"
      status "approved"
      subject_ids "1"
    end

    factory :activity_theme do
      title 'test-theme'
      description 'testing theme search'
      start_date "01/01/2014"
      end_date "01/02/2015"
      deadline "01/02/2010"
      link "www.google.com"
      email "testingthemes@test.com"
      status "approved"
      theme_ids "1"

    end

    factory :activity_delivery do
      title 'test-delivery'
      description 'testing delivery search'
      start_date "01/01/2010"
      end_date "01/02/2011"
      deadline "01/02/2010"
      link "www.google.com"
      email "testingdeliverys@test.com"
      status "approved"
      delivery_ids "1"
    end

    factory :activity_all do
      title 'test-delivery'
      description 'testing delivery search'
      start_date "01/01/2010"
      end_date "04/01/2010"
      deadline "01/02/2010"
      link "www.google.com"
      email "testingdeliverys@test.com"
      status "approved"
      delivery_ids "1"
      theme_ids "1"
      subject_ids "1"



    end
  end


trait :skip_validate do
  to_create {|instance| instance.save(validate: false)}
end



end
