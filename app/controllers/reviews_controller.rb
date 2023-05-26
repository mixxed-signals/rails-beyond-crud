class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    # need to set restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant # or @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurants_path(@restaurant)
    else
      render :new, status: 422 # show error
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
