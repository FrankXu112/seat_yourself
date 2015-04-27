class ReviewsController < ApplicationController
	before_filter :load_restaurant
	before_filter :ensure_logged_in, only: [:create, :destroy]

	def show
		@review = Review.find(params[:id])
	end

	def create
		@review = @restaurant.reviews.build(review_params)
		@review.reviewer = current_user
		if @review.save
			redirect_to restaurant_path(@restaurant)
		else
			render 'restaurants/show'
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to restaurant_path(@restaurant)
	end

	private
	def review_params
		params[:review][:rating] = params[:score]
		p params: params
		params.require(:review).permit(:comment, :rating, :restaurant_id)
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end
