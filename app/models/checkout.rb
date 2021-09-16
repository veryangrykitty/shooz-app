class Checkout < ApplicationRecord
  has_one :payment
  belongs_to :listing
  belongs_to :buyer, class_name: "User"
  monetize :amount_cents


  def seller
    listing.seller
  end
end
