class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    #authenticate comes from the has_secure_password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to recipes_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to recipes_path, :notice => "you're logged out"
  end
end
