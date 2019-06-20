class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }

  validates :username, presence: true,
            length: { minimum: 2, maximum: 15},
            uniqueness: true

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true,
             uniqueness: true,
             format: { with: VALID_EMAIL_REGEX }

  validates :password_digest, presence: true,
             length: { minimum: 6, maximum: 25}

  has_secure_password
end
