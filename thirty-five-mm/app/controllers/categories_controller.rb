class CategoriesController < ApplicationController

	def index
		@first_ten_categories = Category.first_ten_categories
		@second_ten_categories = Category.second_ten_categories
		@third_ten_categories = Category.third_ten_categories

		@films = Film.order(:title).limit(15)
		render :index
	end
end
