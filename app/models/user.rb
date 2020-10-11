class User < ApplicationRecord
  has_secure_password
  belongs_to :band
  validates :username, :email, uniqueness: :true
end
