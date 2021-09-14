class Transaction < ApplicationRecord
  has_one :payment
  belongs_to :listing
  belongs_to :buyer, class_name: "User"

  def seller
    listing.seller
  end
end
