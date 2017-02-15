class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update]

  def index
    if !params[:name]&.empty? && !sanitize_categories&.empty?
      @offers = Offer.where("name like ?", params[:name]).where("category like ?", sanitize_categories)
    elsif !params[:name]&.empty? && sanitize_categories&.empty?
      @offers = Offer.where("name like ?", params[:name])
    elsif params[:name]&.empty? && !sanitize_categories&.empty?
      @offers = Offer.where("category like ?", sanitize_categories)
    end
    @offers = Offer.all unless (params[:name] && !params[:name]&.empty?) || !sanitize_categories.empty?
  end

  def show
  end

  def new
     @offer = Offer.new
  end

  def create
    @offer = Offer.new(params_offer)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:offer][:description]
      @offer.description = params[:offer][:description]
    elsif params[:offer][:address]
      @offer.address = params[:offer][:address]
    elsif params[:offer][:category]
      @offer.category = params[:offer][:category]
    else
      @offer.price = params[:offer][:price]
    end
    @offer.save
    redirect_to offer_path(@offer)
  end

  private

  def offer_field

  end

  def sanitize_categories
    categories = []
    Offer::CATEGORY.each do |category|
      if params[category].present?
        categories << category
      end
    end
    categories.compact
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def params_offer
    params.require(:offer).permit(:name, :description, :category, :price, :photo, :photo_cache)
  end

end
