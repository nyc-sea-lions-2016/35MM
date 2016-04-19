class Review < ActiveRecord::Base
  belongs_to :film
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :ratings, as: :ratable

  validates :film, :user, :content, presence: true

  def no_comments?
    true if self.comments.length < 1
  end

end
