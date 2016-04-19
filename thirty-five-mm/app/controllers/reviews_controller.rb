class ReviewsController < ApplicationController

  def index
  end

  def new
    @film = Film.find(params[:film_id])
    @review = Review.new
    render 'new', locals: { film: @film, review: @review }, layout: false
  end

  def create
    @film = Film.find(params[:film_id])
    @review = @film.reviews.build(reviews_params)
    #Change the following line once sessions/authentication is activated
    @review.user_id = User.first.id
    if @review.save
      flash[:success] = "Review successfully created"
    else
      #Discuss whether the create method for reviews should be AJAXified or not
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def show
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def reviews_params

  end

end