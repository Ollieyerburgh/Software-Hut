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
#  postcode               :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryGirl.create(:user_anon)

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a forename" do
    user.forename = nil
    expect(user).not_to be_valid
  end

  it "is not valid without a surname" do
    user.surname = nil
    expect(user).not_to be_valid
  end

  it "is not valid without a postcode" do
    user.postcode = nil
    expect(user).not_to be_valid
  end

  it "is not vaild without a email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is not valid without proper format of postcode" do
    user.postcode = "abcdefg"
    expect(user).to_not be_valid
  end

  describe "Associations" do
    it { should have_one(:preference) }
    it { should have_many(:resources) }
    it { should have_many(:activities) }
  end



end
