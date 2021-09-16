class ShippingdetailsController < ApplicationController

  def create
    @shippingdetail = Shippingdetail.new(shipping_params)
    @shippingdetail.save
    @listing = Listing.find(params.require(:shippingdetail).permit(:listing_id)[:listing_id])
    @newshippingdetail = Shippingdetail.new
    redirect_to checkout_path(@listing)
  end

  def destroy
    Shippingdetail.destroy(params[:id])
    redirect_back fallback_location: root_path
  end

  private

  def shipping_params
    params.require(:shippingdetail).permit(:firstname, :lastname, :contact, :address, :city, :country, :postal, :user_id)
  end
end
