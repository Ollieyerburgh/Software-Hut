# == Schema Information
#
# Table name: activities
#
#  id                   :integer          not null, primary key
#  title                :string
#  description          :string
#  start_date           :string
#  end_date             :string
#  start_time           :string
#  end_time             :string
#  deadline             :string
#  postcode             :string
#  address              :string
#  eligibility_criteria :string
#  capacity             :integer
#  link                 :string
#  email                :string
#  status               :string           default("pending")
#  tag_id               :integer
#
# Indexes
#
#  index_activities_on_tag_id  (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#

require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
