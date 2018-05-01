# == Schema Information
#
# Table name: preferences
#
#  id            :integer          not null, primary key
#  preference_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  theme_id      :integer
#  delivery_id   :integer
#  user_id       :integer
#
# Indexes
#
#  index_preferences_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Preference < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :deliveries
  has_and_belongs_to_many :ages
  validates :theme_id, :delivery_id, :subject_id, :age_id, presence: false
end
