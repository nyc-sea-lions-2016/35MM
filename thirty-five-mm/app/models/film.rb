class Film < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  has_many :ratings, as: :ratable
  has_many :comments, as: :commentable

  validates :category, :title, presence: true
end
