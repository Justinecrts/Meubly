class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user_offers = Offer.where(user_id:@user)
    @customer_bookings = Booking.where(user_id:@user)
    @owner_bookings = []
    current_user.offers.each do |offer|
      offer.bookings.each do |booking|
        @owner_bookings << booking
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

 def params_user
    params.require(:user).permit(:photo, :photo_cache)
  end

end
