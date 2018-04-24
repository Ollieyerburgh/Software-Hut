# == Schema Information
#
# Table name: preferences
#
<<<<<<< HEAD
#  id            :integer          not null, primary key
#  preference_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  theme_id      :integer
#  delivery_id   :integer
#  user_id       :integer
=======
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  subject_id  :integer
#  theme_id    :integer
#  delivery_id :integer
#  user_id     :integer
>>>>>>> 6c1c6374d4f6343d910d51777245689345257e56
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
  preference = FactoryGirl.create(:preference)

  describe "Associations" do
    it { should have_and_belong_to_many(:subjects) }
    it { should have_and_belong_to_many(:themes) }
    it { should have_and_belong_to_many(:deliveries)}
    it { should belong_to(:user)}

  end

end
