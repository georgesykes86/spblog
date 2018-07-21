class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :delete_all
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
    length: {maximum: 100}, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
