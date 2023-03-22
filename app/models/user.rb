class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, :email, :password, :password_confirmation, presence: true
  validates :username, :email, uniqueness: true
end
