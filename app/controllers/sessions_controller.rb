class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # user submitted valid password
      session[:user_id] = user.id
      redirect_to display_path, notice:
          "<p class='text-info'>Welcome back #{user.first_name}.</p>"
    else
      # User does not exist or password was invalid
      flash[:alert] = '<p class="text-warning">Invalid email or password</p>'
      render :login
    end
  end

  def destroy
    if user = current_user
      session[:user_id] = nil
      redirect_to root_path, notice: "<p class='text-info'>#{user.email} has been logged out.<\p>"
    end
  end
end
