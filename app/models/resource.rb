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

class Resource < ApplicationRecord
  belongs_to :user
  mount_uploaders :resources, ResourceUploader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  validates :description, presence: true
  validates :title, presence: true
  validates :resources, :presence => {:message => "Invalid file type or no file submitted" }

  scope :pending, -> { where(status: 'pending')}
  scope :approved, -> { where(status: 'approved')}
end
