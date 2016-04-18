class User < ActiveRecord::Base
  has_many :reviews
  has_many :ratings
  has_many :comments

  validates :password, presence: true
  validates :email, :username, presence: true, uniqueness: true
end
