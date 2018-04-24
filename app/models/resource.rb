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
#  subject_id  :integer
#
# Indexes
#
#  index_resources_on_subject_id  (subject_id)
#  index_resources_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'will_paginate/array' 


class Resource < ApplicationRecord
  belongs_to :user,  optional: true
  has_and_belongs_to_many :subjects
  mount_uploaders :resources, ResourceUploader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  validates :description, presence: true
  validates :title, presence: true

  scope :query, -> (search) {
    where("lower(description) LIKE ? OR lower(title) LIKE ?", "%#{search.downcase}%","%#{search.downcase}%")
  }
  scope :subject, -> (subject) { where(subject_id: Subject.where(name: subject))}

  scope :pending, -> { where(status: 'pending')}
  scope :approved, -> { where(status: 'approved')}

  include ActiveModel::AttributeMethods

  scope :subject, -> (subject) { where(subject_id: Subject.where(name: subject))}

  private
    def self.filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end

end
