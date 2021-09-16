class OrdersController < ApplicationController
  def create
    listing = Listing.find(params[:id])
    order = Order.create!(listing: listing, sneaker_sku: listing.sneaker_model_name, amount: listing.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        quantity: 1,
        price_data: {
          currency: 'sgd',
          unit_amount: listing.price_cents,
          product_data: {
            name: listing.sneaker_model_name
          }
        }
      }],
      success_url: order_path(order),
      cancel_url: order_path(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
