# == Schema Information
#
# Table name: resources
#
#  id          :integer          not null, primary key
#  title       :string
#  link        :string
#  description :string
#  status      :string           default("pending")
#  email       :string
#  resources   :json
#  user_id     :integer
#
# Indexes
#
#  index_resources_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Resource, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
