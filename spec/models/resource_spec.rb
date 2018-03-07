# == Schema Information
#
# Table name: resources
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :string
#  email         :string
#  tags          :string
#  add_documents :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Resource, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
