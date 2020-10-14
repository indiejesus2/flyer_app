class User < ApplicationRecord
  has_secure_password
  belongs_to :band
  validates_associated :band, message: 'name has already been taken'
  validates :username, :email, uniqueness: { case_sensitve: false }
end
