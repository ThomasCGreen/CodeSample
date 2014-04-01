class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(user_params)
    if @category.save
      session[:category_id] = @category.id
      redirect_to display_path, notice:
          "New Category Created: #{@category.title}"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:category).permit(:title)
  end
end
