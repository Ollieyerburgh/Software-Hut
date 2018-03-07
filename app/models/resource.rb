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

class Resource < ApplicationRecord
end
