class User < ApplicationRecord
  has_many :posts

  validates :username, :email, :password, presence: true
end
