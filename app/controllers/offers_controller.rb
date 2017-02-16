class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_offer, only: [:show, :edit, :update]

  def index
    if !params[:name]&.empty? && !sanitize_categories&.empty?
      @search_result = Offer.where('name ILIKE ?', "%#{params[:name]}%").where("category like ?", sanitize_categories)
    elsif !params[:name]&.empty? && sanitize_categories&.empty?
      @search_result = Offer.where('name ILIKE ?', "%#{params[:name]}%")
    elsif params[:name]&.empty? && !sanitize_categories&.empty?
      @search_result = Offer.where("category like ?", sanitize_categories)
    end

    @search_result = Offer.all unless (params[:name] && !params[:name]&.empty?) || !sanitize_categories.empty?
    @offers = @search_result.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@offers) do |offer, marker|
      marker.lat offer.latitude
      marker.lng offer.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
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
    params.require(:offer).permit(:name, :description, :address, :category, :price, :photo, :photo_cache)
  end

end
