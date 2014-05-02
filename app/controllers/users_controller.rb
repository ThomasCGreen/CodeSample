class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to display_path, notice:
          "<p class='text-success'>Thank you for signing up, #{@user.first_name}!</p>"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
        :first_name, :last_name, :email, :password,
        :password_confirmation, :street, :city, :state, :zip, :cell_phone)
  end
end
