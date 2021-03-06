class OrdersController < ApplicationController
  def create
    listing = Listing.find(params[:id])
    order = Order.create!(listing: listing, sneaker_sku: listing.sneaker_model_name, amount: listing.price, state: 'pending', user: current_user)

    if order.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        mode: 'payment',
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
        success_url: order_url(order),
        cancel_url: order_cancel_url(order)
      )
      order.update(checkout_session_id: session.id)
      redirect_to session.url
    else
      redirect_to "checkouts/new"
    end
  end

  def cancel
    @order = current_user.orders.find(params[:id])
    @order.state = "cancelled"
    @order.save
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end
end
