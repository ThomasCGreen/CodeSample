class BusinessesController < ApplicationController
  def new
    owning_category = Category.find(params[:category_id])
    @business = Business.new
    @business.category_id = owning_category.id
    @owning_category_title = owning_category.title
  end

  def create
    @business = Business.new(business_params)
    @business.user_id = session[:user_id]
    @owning_category = @business.category_id
    if @business.save
      redirect_to show_businesses_path(@owning_category), notice:
          "<p class='text-success'>New Business Created: #{@business.name}</p>"
    else
      render :new
    end
  end

  def show
    @owning_category = Category.find(params[:category_id])
    @business = Business.where(category_id: @owning_category)
  end

  private

  def business_params
    params.require(:business).permit(:name,
                                     :contact,
                                     :product,
                                     :phone,
                                     :website,
                                     :email,
                                     :street,
                                     :city,
                                     :state,
                                     :zip,
                                     :category_id,
    )
  end
end
