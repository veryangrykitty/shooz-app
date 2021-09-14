class Listing < ApplicationRecord
  has_many :transactions
  belongs_to :seller, class_name: "User"

end
