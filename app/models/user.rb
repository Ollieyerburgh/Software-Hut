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
#  role                   :string
#  school                 :string
#  dob                    :string
#  answer                 :string
#  organisation           :string
#  studyyear              :string
#  associatedschool       :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord

  #Relationships
  has_many :activities, dependent: :delete_all
  has_many :resources
  has_one :preference
  acts_as_voter

  #Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_POSTCODE_REGEX =  /\A[a-zA-Z]{1,2}([0-9]{1,2}|[0-9][a-zA-Z])\s*[0-9][a-zA-Z]{2}\z/
  validates :forename, presence: true
  validates :surname, presence: true
  validates :postcode, presence: true, format: { with:  VALID_POSTCODE_REGEX}
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid email address"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  validate :postcode_is_valid

  #Upon succesful validation
  after_create :send_welcome_email

  private

  #Welcome email function
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  #Postcode is valid function which checks against google to see if it's found on their maps service
  def postcode_is_valid
    gmaps = GoogleMapsService::Client.new(key: 'AIzaSyDdFojl37akCcM9_TICN7BWjSALccfO5g0')
    postcode = self.postcode
    begin
      distance = gmaps.distance_matrix(
        postcode,
        's11 8td'
      )
      return true
    rescue
      errors.add(:postcode, "This doesn't appear to be a valid postcode.")
      return false
    end
  end
  
end
