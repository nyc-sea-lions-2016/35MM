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

  def show
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
  end

  def edit
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
  end


  def update
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(reviews_params)
      flash[:success] = 'Review successfully updated'
      render :show
    else
      flash.now.alert = 'There was an issue with updating your review'
      render :edit
    end
  end

  def destroy
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id]).destroy
    flash.now[:success] = 'Review successfully deleted'
    redirect_to @film
  end

  private

  def reviews_params
    params.require(:review).permit(:content)
  end

end
