class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end
