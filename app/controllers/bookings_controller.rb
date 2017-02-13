class BookingsController < ApplicationController

  def index
    @booking = Booking.where(user:current_user)
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.offer = @offer
    @booking.save
  end

  private

  def params_booking
    params.require(:booking).permit(:status)
  end

end
