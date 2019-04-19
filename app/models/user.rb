class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }
  before_save :remove_whitespace, :downcase_field

  def self.authenticate_with_credentials email, password
    email.strip!
    email.downcase!
    if user = User.find_by(email: email).try(:authenticate, password)
      user
    else
      nil
    end
  end
  
  def remove_whitespace
    self.email.strip!
  end

  def downcase_field
    self.email.downcase!
  end

end
