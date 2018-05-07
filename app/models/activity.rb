# == Schema Information
#
# Table name: activities
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  start_date              :string
#  end_date                :string
#  start_time              :string
#  end_time                :string
#  deadline                :string
#  postcode                :string
#  address                 :string
#  eligibility_criteria    :string
#  capacity                :integer
#  link                    :string
#  email                   :string
#  status                  :string           default("pending")
#  tag_id                  :integer
#  cached_votes_total      :integer          default(0)
#  cached_votes_score      :integer          default(0)
#  cached_votes_up         :integer          default(0)
#  cached_votes_down       :integer          default(0)
#  cached_weighted_score   :integer          default(0)
#  cached_weighted_total   :integer          default(0)
#  cached_weighted_average :float            default(0.0)
#  user_id                 :integer
#  subject_id              :integer
#
# Indexes
#
#  index_activities_on_subject_id  (subject_id)
#  index_activities_on_tag_id      (tag_id)
#  index_activities_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (user_id => users.id)
#

class Activity < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :themes
  has_and_belongs_to_many :deliveries
  has_and_belongs_to_many :ages

  belongs_to :user, optional: true

  self.table_name = "activities"
  acts_as_votable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_POSTCODE_REGEX =  /\A[a-zA-Z]{1,2}([0-9]{1,2}|[0-9][a-zA-Z])\s*[0-9][a-zA-Z]{2}\z/
  VALID_DATE_REGEX = /\A(?:0?[1-9]|1[0-2])\/(?:0?[1-9]|[1-2]\d|3[01])\/\d{4}\Z/
  validates :title, presence: true, :if => lambda { |a| a.current_step == "main" }
  validates :description, presence: true, :if => lambda { |a| a.current_step == "main" }
  validates :start_date, presence: true, :if => lambda { |a| a.current_step == "date" }
  validates :end_date, presence: true, :if => lambda { |a| a.current_step == "date" }
  validates :deadline, presence: true, :if => lambda { |a| a.current_step == "date" }
  validates :postcode, presence: true, format: {with: VALID_POSTCODE_REGEX, message: "Invalid postcode format"}, :if => lambda { |a| a.current_step == "main" }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}, :if => lambda { |a| a.current_step == "main" }
  validates :link, presence: true, :if => lambda { |a| a.current_step == "main" }
  include ActiveModel::AttributeMethods

  attr_accessor :terms_of_service
  attr_writer :current_step
  validates :terms_of_service, acceptance: { accept: '1' } , :if => lambda { |a| a.current_step == "rest" }

  scope :pending, -> { where(status: 'pending')}
  scope :approved, -> { where(status: 'approved')}
  scope :description, -> (description) { where("description like ? ",  "#{description}")}
  scope :rejected, -> { where(status: 'rejected')}
  scope :query, -> (search) {
    where("lower(description) LIKE ? OR lower(title) LIKE ? OR lower(address) LIKE ?", "%#{search.downcase}%","%#{search.downcase}%" ,"%#{search.downcase}%")
  }
  scope :subject, -> (subject) { where(subject_id: Subject.where(name: subject))}
  scope :theme, -> (theme) {joins(:themes).where(themes: { name: theme })}
  scope :delivery, -> (delivery) {joins(:deliveries).where(deliveries: { method: delivery })}

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[main date rest]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step
    current_step == steps.first
  end

  def last_step
    current_step == steps.last
  end

  private
    def self.filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end


end
