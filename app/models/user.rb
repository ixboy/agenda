class User < ApplicationRecord
  has_secure_password

  before_save :email_downcase

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 15 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }

  has_many :contacts

  private

  def email_downcase
    email.downcase!
  end
end
