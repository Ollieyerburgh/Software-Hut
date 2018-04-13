# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  preference_id :integer
#
# Indexes
#
#  index_subjects_on_preference_id  (preference_id)
#
# Foreign Keys
#
#  fk_rails_...  (preference_id => preferences.id)
#

require 'rails_helper'

RSpec.describe Subject, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
