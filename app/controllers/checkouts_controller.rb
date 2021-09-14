class CheckoutsController < ApplicationController
  def new
    @checkout = Checkout.new
    @payment = Payment.new
  end

  def create

    if @checkout.save
      #=> Goes to transaction completed page. to add additional route
    else
      #=> goes to back to checkout page
    end
  end
end
