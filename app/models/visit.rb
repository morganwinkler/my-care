class Visit < ApplicationRecord
  belongs_to :user
  has_many :doctors
  has_many :nurses
  has_many :medications
  has_many :procedures
  has_many :questions
end
