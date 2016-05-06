class Category < ActiveRecord::Base
  has_many :films

  validates :name, presence: true, uniqueness: true

  def category_count
    Category.all.count
  end

  def alphabetize
    self.order(:name)
  end

  def feature_film
    films = Film.all
  end
end
