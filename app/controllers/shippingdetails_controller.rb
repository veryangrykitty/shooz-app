class ShippingdetailsController < ApplicationController

  # def new
  #   @shippingdetail = Shippingdetail.new
  # end

  def create
    @shippingdetail = Shippingdetail.new(shipping_params)
    @shippingdetail.save
    @listing = Listing.find(params.require(:shippingdetail).permit(:listing_id)[:listing_id])
    @newshippingdetail = Shippingdetail.new
    redirect_to checkout_path(@listing)
  end

  private

  def shipping_params
    params.require(:shippingdetail).permit(:firstname, :lastname, :contact, :address, :city, :country, :postal, :user_id)
  end
end
