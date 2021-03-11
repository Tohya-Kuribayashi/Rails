class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/
  validates :password, length: { in: 8..32 }, format: { with: VALID_PASSWORD_REGEX }
  validates :name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  
  has_secure_password
  
  has_many :topics
end
