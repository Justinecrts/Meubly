class BookingsController < ApplicationController
  before_action :set_offer, only: :create
  before_action :set_booking, only: :update


  def create
    @booking = Booking.new
    @booking.offer = @offer
    @booking.user = current_user
    @booking.status = "Pending"
    @booking.save
    redirect_to user_path(current_user)
  end

  def update
    @booking.update(booking_params)
    @booking.save
    redirect_to user_path(current_user)
  end

  def puts
    @booking.status = "Declined"
    @booking.save
    redirect_to user_path(current_user)
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)

  end
end
