class Category < ActiveRecord::Base
  has_many :films

  validates :name, presence: true, uniqueness: true

  def category_count
    Category.all.count
  end

  def alphabetize
    self.order(:name)
  end
  # def top_five
  #   ratings = Rating.where(ratable_type: "Film")
  #   ratings.order("stars DESC")
  #   top_five_ratings = []
  #   top_five_films = []

  #   5.times do
  #     f = ratings.first
  #     top_five_ratings.push(f)
  #   end

  #   top_five_ratings.each do |r|
  #     f = Film.find(r.ratable_id)
  #     top_five_films.push(f)
  #   end
  #   top_five_films
  # end

  def feature_film
    films = Film.all

  end
end
