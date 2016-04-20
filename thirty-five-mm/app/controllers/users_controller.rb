class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(email: params[:email], username: params[:username], password: params[:password])

    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      # flash[:errors] =
      render :new
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.assign_attributes(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      redirect_to user_path
    else
      @errors = @user.errors.full_messages
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
