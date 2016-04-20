class RatingsController < ApplicationController

  def create
    if params[:film_id]
      @film = Film.find(params[:film_id])
      # binding.pry
      @rating = @film.ratings.new(ratings_params)
      @rating.user_id = current_user.id
      @rating.ratable_type ="Film"
      @rating.ratable_id = @film.id
        if  @rating.save
          flash[:success] = "Rating successfully saved"
          redirect_to @film
        else
          flash.now.alert = "There was an issue with the creation of your rating"
          render '_film_new_rating.html.erb'
        end
    else
      @review = Review.find(params[:review_id])
      @rating = @review.ratings.new(ratings_params)
      @rating.user_id = current_user.id
        if request.xhr? && @rating.save
          flash[:success] = "Rating successfully saved"
          render '_review_rating.html.erb', locals: { review: @review, rating: @rating }, layout: false
        else
          flash.now.alert = "There was an issue with the creation of your rating"
          render '_review_new_rating.html.erb', locals: { review: @review, rating: @rating}, layout: false
        end
    end
  end

  private

  def ratings_params
    # binding.pry
    params.require(:rating).permit(:stars)
  end

end
