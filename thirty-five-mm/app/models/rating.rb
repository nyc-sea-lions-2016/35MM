class Rating < ActiveRecord::Base
  belongs_to :film
  # belongs_to :review
  # belongs_to :user
  belongs_to :ratable, polymorphic: true

  validates :user, presence: true
end
