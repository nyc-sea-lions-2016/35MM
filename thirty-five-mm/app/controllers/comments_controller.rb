class CommentsController < ApplicationController

  def new
    @film = Film.find(params[:film_id])
    @comment = Comment.new
    render 'new', locals: { film: @film, comment: @comment }, layout: false
  end

  def create
    @film = Film.find(params[:film_id])
    @comment = @film.comments.build(comments_params)
    @comment.user_id = User.first.id
    if request.xhr? && @comment.save
      flash[:success] = "Comment successfully created"
      render '_comment.html.erb', locals: { film: @film, comment: @comment }, layout: false
    else
      flash.now.alert = 'There was an issue with the creation of your comment'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

end
