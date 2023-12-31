class Visit < ApplicationRecord
  belongs_to :user
  has_many :doctors
  has_many :nurses
end
