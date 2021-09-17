class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end

  def stripe
    payload = request.body.read
    event = nil

    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
      )
    rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    end

    # Handle the event
    case event.type
    # when 'payment_intent.succeeded'
    #   payment_intent = event.data.object # contains a Stripe::PaymentIntent
    #   puts 'PaymentIntent was successful!'
    # when 'payment_method.attached'
    #   payment_method = event.data.object # contains a Stripe::PaymentMethod
    #   puts 'PaymentMethod was attached to a Customer!'
    # # ... handle other event types
    when 'checkout.session.completed' || 'checkout.session.async_payment_succeeded'
      order = Order.find_by(checkout_session_id: event.data.object.id)
      order.update(state: 'paid')
    when 'checkout.session.expired' || 'checkout.session.async_payment_failed'
      order = Order.find_by(checkout_session_id: event.data.object.id)
      order.update(state: 'unsuccessful')
    else
      puts "Unhandled event type: #{event.type}"
    end

    status 200
  end
end
