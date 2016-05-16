class FilmsController < ApplicationController

  def index

  end

  def new
    @film = Film.new(params[:id])
  end

  def create
    @film = Film.new(film_params)
  end

  def show
    @film = Film.find(params[:id])
    @rating = Rating.new
  end

  def edit
  end

  def update
  end

  def destroy

  end

  def search
    @films = Film.search(params[:search])
    if @films
    else
      # Indicate no results, don't load blank page
    end
  end

  private

  def film_params
    params.require(:film).permit(:title)
  end

end

