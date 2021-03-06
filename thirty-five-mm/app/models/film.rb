class Film < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  has_many :ratings, as: :ratable
  has_many :comments, as: :commentable

  validates :category, :title, presence: true


  def self.search(search)
  	if search
  		Film.where(title: search).to_a
  	else
  		Film.all
  	end
  end

	def no_of_stars
    self.ratings.average('stars')
	end

  def has_been_rated?(current_user_id)
    self.ratings.find_by(user_id: current_user_id)
  end
end
