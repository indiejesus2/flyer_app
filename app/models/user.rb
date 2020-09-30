class User < ApplicationRecord
  belongs_to :band
  has_secure_password
end
