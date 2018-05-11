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
#  user_id     :integer
#
# Indexes
#
#  index_preferences_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Preference, type: :model do

  describe "Associations" do
    it { should have_and_belong_to_many(:subjects) }
    it { should have_and_belong_to_many(:themes) }
    it { should have_and_belong_to_many(:deliveries)}
    it { should belong_to(:user)}

  end

end
