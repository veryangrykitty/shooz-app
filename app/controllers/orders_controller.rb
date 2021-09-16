class OrdersController < ApplicationController
  def create
    listing = Listing.find(params[:id])
    order  = Order.create!(listing: listing, sneaker_sku: listing.sneaker_model_name, amount: listing.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: listing.sneaker_model_name,
        amount: listing.price_cents,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end
end
