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
#  user_id     :integer
#  subject_id  :integer
#  file        :string
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

class Resource < ApplicationRecord
  mount_uploader :file, FileUploader
  belongs_to :user,  optional: true
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :deliveries
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  validates :description, presence: true
  validates :title, presence: true
  include ActiveModel::AttributeMethods
  attr_accessor :terms_of_service
  validates :terms_of_service, acceptance: { accept: '1' }


  scope :query, -> (search) {
    where("lower(description) LIKE ? OR lower(title) LIKE ?", "%#{search.downcase}%","%#{search.downcase}%")
  }
  scope :subject, -> (subject) { where(subject_id: Subject.where(name: subject))}

  scope :pending, -> { where(status: 'pending')}
  scope :approved, -> { where(status: 'approved')}
  scope :rejected, -> { where(status: 'rejected')}
  scope :theme, -> (theme) { joins(:themes).where(themes: { name: theme }) }

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
