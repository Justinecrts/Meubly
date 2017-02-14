class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user_offers = Offer.where(user_id:@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
