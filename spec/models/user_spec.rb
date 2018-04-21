# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  forename               :string
#  surname                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  address_id             :integer
#  postcode               :string
#
# Indexes
#
#  index_users_on_address_id            (address_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject = FactoryGirl.create(:user)

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a forename" do
    subject.forename = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a surname" do
    subject.surname = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a postcode" do
    subject.postcode = nil
    expect(subject).not_to be_valid
  end

  it "is not vaild without a email" do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without proper format of postcode" do
    subject.postcode = "abcdefg"
    expect(subject).to_not be_valid
  end



end
