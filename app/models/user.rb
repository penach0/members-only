class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, :email, :password, presence: true

  def authenticate?(pwd)
    password == pwd
  end
end
