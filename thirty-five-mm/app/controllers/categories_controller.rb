class CategoriesController < ApplicationController

	def index
    @categories = Category.all
    @films = Film.all
		render :index
	end
end
