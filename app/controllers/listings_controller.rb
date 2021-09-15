class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :show, :update]
  # before_action :set_all_listings, only: [:index, :show]

  def index
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
    @seller = User.find(params[:id])
    @listings = Listing.where("seller_id = #{params[:id]}")
  end

  def category
    @listings = Listing.filter(params[:value])
  end

  def search

  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:brand, :sneaker_model_name, :size, :price, :condition, :availability)
  end

  # def set_all_listings
  #   @empty_listing = Listing.new
  # end
end
