class CategoriesController < ApplicationController
  def new
    upper_level_category = Category.find(params[:category_id])
    @category = Category.new
    @category.category_id = upper_level_category.id
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to display_path, notice:
          "<p class='text-success'>New Category Created: #{@category.title}</p>"
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :category_id)
  end
end
