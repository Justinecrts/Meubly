class BookingsController < ApplicationController
  before_action :set_offer, only: :create
  before_action :set_booking, only: :update


  def create
    @date = params["booking"]["fullrange"]
    @dates = @date.split(" - ")
    dates_formated = []
    @dates.each do |date|
      days_unformated = date.split("/")
      d =  DateTime.parse("#{days_unformated[2]}/#{days_unformated[0]}/#{days_unformated[1]}")
      dates_formated << d
    end
    @days = (dates_formated[1]-dates_formated[0]).to_i
    @final_price = @days * @offer.price
    @booking = Booking.new(days: @days,date: @date, final_price: @final_price)
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
    params.require(:booking).permit(:status, :final_price, :date, :days )

  end
end
