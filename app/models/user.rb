class User < ApplicationRecord
  validates :email, :password, :api_key, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
