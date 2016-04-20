class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :ratable, polymorphic: true

  validates :user, presence: true
end
