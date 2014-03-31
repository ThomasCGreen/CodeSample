class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # user submitted valid password
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back #{user.first_name}."
    else
      # User doe not exist or password was invalid
      flash[:alert] = 'Invalid email or password'
      render :login
    end
  end

  def destroy
    if user = current_user
      session[:user_id] = nil
      redirect_to root_path, notice: "#{user.email} has been logged out."
    end
  end
end
