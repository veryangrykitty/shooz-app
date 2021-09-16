class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :show, :update, :destroy]
  # before_action :set_all_listings, only: [:index, :show]

  def index
    # needed for pages#home
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.availability = true
    @listing.seller = current_user
    if @listing.save
      redirect_to seller_path(current_user)
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
    @listing.availability = true
    @listing.seller = current_user
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing.destroy
    redirect_to seller_path(current_user)
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
    params.require(:listing).permit(:brand, :sneaker_model_name, :size, :price, :condition, :gender, photos: [])
  end

  # def set_all_listings
  #   @empty_listing = Listing.new
  # end
end
