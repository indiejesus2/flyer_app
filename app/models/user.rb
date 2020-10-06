class User < ApplicationRecord
  belongs_to :band
  has_secure_password
  validates :username, :email, uniqueness: :true
end
