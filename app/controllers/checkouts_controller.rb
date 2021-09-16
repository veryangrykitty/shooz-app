class CheckoutsController < ApplicationController
  def new
    @listing = Listing.find(params[:id])
    @checkout = Checkout.new
    @payment = Payment.new
    @newshippingdetail = Shippingdetail.new
    @shippingdetails = Shippingdetail.where("user_id = #{current_user.id}")
  end

  def create
    listing = Listing.find(params[:id])
    checkout  = Checkout.create!(listing: listing, sneaker_model_name: listing.sneaker_model_name, amount: listing.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: teddy.sku,
        images: [teddy.photo_url],
        amount: teddy.price_cents,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: checkout_url(checkout),
      cancel_url: checkout_url(checkout)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
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
