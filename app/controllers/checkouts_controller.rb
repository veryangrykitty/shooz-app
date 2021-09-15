class CheckoutsController < ApplicationController
  def new
    @listing = Listing.find(params[:id])
    @checkout = Checkout.new
    @payment = Payment.new
    @newshippingdetail = Shippingdetail.new
    @shippingdetail = Shippingdetail.where("user_id = #{current_user.id}")
  end

  def create

    if @checkout.save
      #=> Goes to transaction completed page. to add additional route
    else
      #=> goes to back to checkout page
    end
  end
end
