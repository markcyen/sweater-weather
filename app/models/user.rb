class User < ApplicationRecord
  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
end
