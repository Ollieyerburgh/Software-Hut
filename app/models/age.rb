class Age < ApplicationRecord
  has_and_belongs_to_many :preferences
  has_and_belongs_to_many :activities
  validates :age, presence: false
end
