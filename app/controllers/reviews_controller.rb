# frozen_string_literal: true

# Reviews controller class
class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to @restaurant, notice: 'Review created successfully'
    else
      render 'restaurants/show'
    end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    @review.restaurant = @restaurant
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
