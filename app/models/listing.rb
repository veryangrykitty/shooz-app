class Listing < ApplicationRecord
  has_many :checkout
  belongs_to :seller, class_name: "User"

  monetize :price_cents

  has_many_attached :photos
end
