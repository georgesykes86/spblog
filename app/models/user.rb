class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :delete_all
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
    length: {maximum: 100}, uniqueness: { case_sensitive: false }
  has_secure_password
end
