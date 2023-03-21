class User < ApplicationRecord
  has_many :posts

  validates :username, :email, :password, presence: true

  def authenticate?(pwd)
    password == pwd
  end
end
