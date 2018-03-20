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
#

class Resource < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  validates :description, presence: true
  validates :title, presence: true
  
  scope :pending, -> { where(status: 'pending')}
  scope :approved, -> { where(status: 'approved')}
end
