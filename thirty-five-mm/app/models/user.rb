class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :ratings
  has_many :comments

  validates :password, presence: true
  validates :email, :username, presence: true, uniqueness: true

  def review_count
    self.reviews.count
  end

  def comment_count
    self.comments.count
  end
end
