class Listing < ApplicationRecord
  has_many :checkout
  belongs_to :seller, class_name: "User"

end
