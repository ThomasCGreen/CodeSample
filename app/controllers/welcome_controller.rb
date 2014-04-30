class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to display_path
    end
  end
end
