class CategoriesController < ApplicationController

	def index
    @categories = Category.order(:name)
    @films = Film.order(:title)
		render :index
	end
end
