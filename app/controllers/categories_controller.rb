class CategoriesController < ApplicationController
  def new
    @category = Category.new(category_id: params[:category_id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      session[:category_id] = @category.id
      redirect_to display_path, notice:
          "New Category Created: #{@category.title}"
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :category_id)
  end
end
