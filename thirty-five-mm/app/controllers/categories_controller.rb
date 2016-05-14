class CategoriesController < ApplicationController

	def index
    @categories = Category.order(:name)
    @films = Film.order(:title).limit(15)
		render :index
	end
end
