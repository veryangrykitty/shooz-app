class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :show, :update]

  def index
    @listings = Listing.all.first(16)
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def show
  end

  def update

  end

  def seller_all
    seller_id = current_user.id
    @listings = Listing.filter(params[seller_id])
  end

  def category
    @listings = Listing.filter(params[:value])
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:brand, :sneaker_model_name, :size, :price, :condition, :availability)
  end
end
