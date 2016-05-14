class Category < ActiveRecord::Base
  has_many :films

  validates :name, presence: true, uniqueness: true

  def self.first_ten_categories
    Category.order(:name).limit(10)
  end

  def self.second_ten_categories
    Category.order(:name).offset(10).limit(10)
  end

  def self.third_ten_categories
    Category.order(:name).offset(20).limit(10)
  end

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
