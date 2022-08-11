class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true
  
  before_create :api_gen
  has_secure_password

  def api_gen
    self.api_key = SecureRandom.hex(20)
  end
end
