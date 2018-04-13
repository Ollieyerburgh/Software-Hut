# == Schema Information
#
# Table name: preferences
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#
# Indexes
#
#  index_preferences_on_subject_id  (subject_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#

require 'rails_helper'

RSpec.describe Preference, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
