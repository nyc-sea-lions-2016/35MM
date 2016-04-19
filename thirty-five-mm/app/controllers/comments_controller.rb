class CommentsController < ApplicationController

  def new
    @film = Film.find(params[:film_id])
    @comment = Comment.new
    render 'new', locals: { film: @film, comment: @comment }, layout: false
  end

  def create
    @film = Film.find(params[:film_id])
    @comment = @film.comments.build(comments_params)
    #Change the following line once sessions/authentication is activated
    @comment.user_id = User.first.id
    if request.xhr? && @comment.save
      flash[:success] = "Comment successfully created"
      render '_comment.html.erb', locals: { film: @film, comment: @comment }, layout: false
    else
      flash.now.alert = 'There was an issue with the creation of your comment'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @film = Film.find(params[:film_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment successfully removed"
    render text:"ok" #Fix this portion so that correct redirect occurs
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

end
