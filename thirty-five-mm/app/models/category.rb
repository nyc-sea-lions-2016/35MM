class Category < ActiveRecord::Base
  has_many :films

  validates :name, presence: true, uniqueness: true
end
