class User < ApplicationRecord
  has_many :articles, dependent: :delete_all
  validates :password, presence: true, length: {minimum: 8}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end