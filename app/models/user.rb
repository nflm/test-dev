class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :comments, dependent: :destroy

  validates :nickname, uniqueness: true
  validates :email, uniqueness: true
end
