class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :visits
  has_many :doctors, through: :visits
  has_many :nurses, through: :visits
end
