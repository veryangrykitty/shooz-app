class CheckoutsController < ApplicationController
  def new
    @listing = Listing.find(params[:id])
    @checkout = Checkout.new
    @payment = Payment.new
    @newshippingdetail = Shippingdetail.new
    @shippingdetails = Shippingdetail.where("user_id = #{current_user.id}")
  end

  def create
    @listing = Listing.find(params[:id])
    @checkout = Checkout.new
    @checkout.listing = @listing
    if @checkout.save
      #=> Goes to transaction completed page. to add additional route
      redirect_to "payments/new"
    else
      #=> goes to back to checkout page
      render :new
    end
  end

  def add_shipping_detail
    @listing = Listing.find(params[:id])
    @newshippingdetail = Shippingdetail.new
    @shippingdetails = Shippingdetail.where("user_id = #{current_user.id}")

    render :new
  end

  private

  def checkout_params
    params.require(:checkout).permit(:shipping_id)
  end
end
