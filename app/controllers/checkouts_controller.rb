class CheckoutsController < ApplicationController
  def new
    @listing = Listing.find(params[:id])
    # @checkout = Checkout.new
    # @payment = Payment.new
    @newshippingdetail = Shippingdetail.new
    @shippingdetails = Shippingdetail.where("user_id = #{current_user.id}")
  end

  def add_shipping_detail
    @listing = Listing.find(params[:id])
    @newshippingdetail = Shippingdetail.find(params[:shipping_id])
    @shippingdetails = Shippingdetail.where("user_id = #{current_user.id}")
    render :new
  end
end
