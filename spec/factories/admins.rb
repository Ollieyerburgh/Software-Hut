# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
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
#  higher_access          :boolean          default(FALSE)
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :admin do
    email {'admin@admin.com'}
    password {'test1234'}
    higher_access true

    factory :admin_lower do
      email {'admintest@admin.com'}
      password {'password12'}
      higher_access false
    end

    factory :admin_higher2 do
      email{'a1dmin@admin.com'}
      password 'password'
      higher_access true
    end

  end
end
