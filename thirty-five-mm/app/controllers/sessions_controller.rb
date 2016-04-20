class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      # redirect to root for testing, change back to commented line.
      redirect_to root_path
      # redirect_to user_path(user)
    else
      flash.now.alert = 'Incorrect email or password'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
