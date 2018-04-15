# == Schema Information
#
# Table name: themes
#
#  id            :integer          not null, primary key
#  theme_name    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  preference_id :integer
#
# Indexes
#
#  index_themes_on_preference_id  (preference_id)
#
# Foreign Keys
#
#  fk_rails_...  (preference_id => preferences.id)
#

class Theme < ApplicationRecord
end
