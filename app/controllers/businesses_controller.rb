class BusinessesController < ApplicationController
  def new
    owning_category = Category.find(params[:category_id])
    @business = Business.new
    @business.category_id = owning_category.id
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to display_path, notice:
          "New Business Created: #{@business.name}"
    else
      render :new
    end
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
