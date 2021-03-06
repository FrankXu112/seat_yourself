class RestaurantsController < ApplicationController
	before_filter :ensure_logged_in, only: [:new, :create, :edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			redirect_to restaurants_path
		else
			render :new
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		if current_user
			@review = @restaurant.reviews.build
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_path(@restaurant)
		else
			render :edit
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

	private
	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :phone, :description, :url, :category_id)
	end
end