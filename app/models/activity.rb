# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  title           :string
#  description    :string
#  start_date     :string
#  end_date       :string
#  start_time     :string
#  end_time       :string
#  link           :string
#  address        :string
#  postcode       :string
#  tags           :string
#  add_documents  :string
#  email          :string
#  deadline       :string
#  eligability    :string
#  capacity       :integer
#  status         :string           default("Pending")


class Activty < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :title, presence: true, format: {with: /\A[a-zA-Z]+\z/,message: "Title cannot contain numbers" }
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :deadline, presence: true
  validates :address, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  validates :link, presence: true

  scope :pending, -> { where(request_status: 'Pending')}
  scope :approved, -> { where(request_status: 'Approved')}
end
