# == Schema Information
#
# Table name: deliveries
#
#  id              :integer          not null, primary key
#  delivery_method :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  preference_id   :integer
#
# Indexes
#
#  index_deliveries_on_preference_id  (preference_id)
#
# Foreign Keys
#
#  fk_rails_...  (preference_id => preferences.id)
#

FactoryGirl.define do
  factory :delivery do
    
  end
end
