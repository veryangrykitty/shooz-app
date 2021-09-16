class Listing < ApplicationRecord
  has_many :checkout
  belongs_to :seller, class_name: "User"

  monetize :price_cents

end
