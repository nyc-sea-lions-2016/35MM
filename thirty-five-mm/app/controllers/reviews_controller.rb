  class ReviewsController < ApplicationController

  def index
    @film = Film.find(params[:film_id])
    render 'reviews/index.html.erb'
  end

  def new
    @film = Film.find(params[:film_id])
    @review = Review.new
    render '_new.html.erb'
  end

  def create
    @film = Film.find(params[:film_id])
    @review = @film.reviews.build(reviews_params)
    @review.user_id = User.first.id
    if @review.save
      flash[:success] = "Review successfully saved"
      render 'reviews/show.html.erb'
    else
      flash.now.alert = "There was an issue with the creation of your review"
      render '_new.html.erb'
    end
  end

  def show
    @film = Film.find(params[:film_id])
    @review = Review.find(params[:id])
    render :show
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
