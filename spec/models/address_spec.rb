# == Schema Information
#
# Table name: addresses
#
#  id       :integer          not null, primary key
#  postcode :string
#  city     :string
#  user_id  :integer
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
