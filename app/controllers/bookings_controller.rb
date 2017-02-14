class BookingsController < ApplicationController
  before_action :set_offer, only: :create

  def create
    @booking = Booking.new
    @booking.offer = @offer
    @booking.user = current_user
    @booking.status = "Pending"
    @booking.save
    redirect_to user_path(current_user)
  end

  private

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
