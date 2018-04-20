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
#

class Preference < ApplicationRecord
  belongs_to :subject
  belongs_to :theme
  belongs_to :delivery
  validates :subject_id, :theme_id, :delivery_id, presence: false
end
