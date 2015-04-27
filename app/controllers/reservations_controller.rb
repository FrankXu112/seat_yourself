class ReservationsController < ApplicationController
	before_filter :load_restaurant
	before_filter :ensure_logged_in, only: [:create, :destroy]

	def new
		@reservation = @restaurant.reservations.build
	end

	def create
		@reservation = @restaurant.reservations.build(reservation_params)
		# @reservation.user = current_user
		if @reservation.save
			redirect_to restaurant_path(@restaurant), notice: "You have successfully booked an reservation!"
		else
			render 'restaurant/show'
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to restaurant_path(@restaurant)
	end

	private
	def reservation_params
		params.require(:reservation).permit(:time, :seats, :restaurant_id).merge({user_id: current_user.id})
	end

	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end
end