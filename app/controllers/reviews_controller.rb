class ReviewsController < ApplicationController
  def new
    @owning_business = Business.find(params[:business_id])
    @review = Review.new(business_id: @owning_business.id,
                         user_id: session[:user_id])
    @ratings = { "1 - Low" => 1,
        "2 - Below Average" => 2,
        "3 - Average" => 3,
        "4 - Good" => 4,
        "5 - Excellent" => 5}
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    @owning_business = Business.find(@review.business_id)
    if @review.save
      redirect_to show_reviews_path(@owning_business), notice:
          "New Review Created For #{@owning_business.name}"
    else
      render :new
    end
  end

  def show
    @owning_business = Business.find(params[:business_id])
    @business = Business.where(id: @owning_business)
  end

  private

  def review_params
    params.require(:review).permit(:rating,
                                   :description,
                                   :business_id
    )
  end
end