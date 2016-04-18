class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  belongs_to :film

  validates :content, :user, presence: true
end