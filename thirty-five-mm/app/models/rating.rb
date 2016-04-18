class Rating < ActiveRecord::Base
  belongs_to :film
  belongs_to :review
  belongs_to :user

  validates :ratable, :user, presence: true
end
