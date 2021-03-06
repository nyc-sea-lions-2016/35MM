class CommentsController < ApplicationController

  def new
    if params[:film_id]
      @film = Film.find(params[:film_id])
      @comment = Comment.new
      render '_film_new_comment.html.erb', locals: { film: @film, comment: @comment }, layout: false
    else
      @review = Review.find(params[:review_id])
      @comment = Comment.new
      render '_review_new_comment.html.erb', locals: { review: @review, comment: @comment}, layout: false
    end
  end

  def create
    if params[:film_id]
      @film = Film.find(params[:film_id])
      @comment = @film.comments.build(comments_params)
      @comment.user_id = current_user.id
        if request.xhr? && @comment.save
          flash[:success] = "Comment successfully saved"
          render '_film_comment.html.erb', locals: {film: @film, comment: @comment}, layout: false
        else
          flash.now.alert = "There was an issue with the creation of your comment"
          render '_film_new_comment.html.erb'
        end
    else
      @review = Review.find(params[:review_id])
      @comment = @review.comments.build(comments_params)
      @comment.user_id = User.first.id
        if request.xhr? && @comment.save
          flash[:success] = "Comment successfully saved"
          render '_review_comment.html.erb', locals: { review: @review, comment: @comment }, layout: false
        else
          flash.now.alert = "There was an issue with the creation of your comment"
          render '_review_new_comment.html.erb', locals: { review: @review, comment: @comment}, layout: false
        end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if params[:film_id] && request.xhr?
      @film = Film.find_by(id: params[:film_id])
      @comment = @film.comments.find(params[:id])
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to film_path(@film) }
        format.js { render nothing: true }
      end
    elsif params[:review_id] && request.xhr?
      @review = Review.find(params[:review_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

end
