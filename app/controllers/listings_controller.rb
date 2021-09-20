class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :show, :update, :destroy]
  # before_action :set_all_listings, only: [:index, :show]

  def index
    # needed for page#home
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
    # needed
  end

  def show
    @listings = @listing.seller.listings # to show listings from same seller
    @listings = @listings.reject { |ele| ele.id == params[:id].to_i }.sample(3)
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
    all_query
    @seller = User.find(params[:id])
    @listings = Listing.where("seller_id = #{params[:id]}")

    search_check
  end

  def seller_ship
    all_query
    @seller = User.find(params[:id])
    @listings = Listing.where("seller_id = #{params[:id]} AND availability = false")

    search_check
  end

  def category
    @listings = Listing.filter(params[:value])
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:brand, :sneaker_model_name, :size, :price, :condition, :gender, photos: [])
  end

  def search_check
    if params[:query].present?
      @listings = @listings.where("brand ILIKE ?", "%#{params[:query]}%")
    end
  end

  def all_query
    @query = params[:query]
    @size = [params[:size_type], params[:size]].join(' ')
    @gender = params[:gender]
    @price_range = [params[:price_more_than], params[:price_less_than]].join(' – ')
  end
  # def set_all_listings
  #   @empty_listing = Listing.new
  # end
end
