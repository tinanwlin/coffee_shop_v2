class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }
end
