class OffersController < ApplicationController
  before_action :set_offers, only: [:show, :edit, :update]

  def index
     @offers = Offer.all
  end

  def show
  end

  def new
     @offer = Offer.new
  end

  def create
    @offer = Offer.new(params_offer)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer.update(params[:offer])
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def params_offer
    params.require(:offer).permit(:name, :image_url, :description, :category, :price)
  end

end
