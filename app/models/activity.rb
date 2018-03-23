# == Schema Information
#
# Table name: activities
#
#  id                   :integer          not null, primary key
#  title                :string
#  description          :string
#  start_date           :string
#  end_date             :string
#  start_time           :string
#  end_time             :string
#  deadline             :string
#  postcode             :string
#  address              :string
#  eligibility_criteria :string
#  capacity             :integer
#  link                 :string
#  email                :string
#  status               :string           default("pending")
#  tag_id               :integer
#
# Indexes
#
#  index_activities_on_tag_id  (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#

class Activity < ApplicationRecord
  self.table_name = "activities"
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :title, presence: true, format: {with: /\A[a-zA-Z]+\z/,message: "Title cannot contain numbers" }
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :deadline, presence: true
  validates :address, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  validates :link, presence: true

  scope :pending, -> { where(status: 'pending')}
  scope :approved, -> { where(status: 'approved')}
  scope :description, -> (description) { where("description like ? ",  "#{description}")}
  scope :rejected, -> { where(status: 'rejected')}

end
