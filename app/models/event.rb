# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :string
#  startdate     :date
#  enddate       :date
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location      :string
#  tags          :string
#  add_documents :string
#  email         :string
#  deadlinedate  :date
#  eligability   :string
#  capacity      :integer
#

class Event < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, format: {with: /\A[a-zA-Z]+\z/,message: "Title cannot contain numbers" }
  validates :description, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :deadlinedate, presence: true
  validates :location, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  validates :url, presence: true
end
