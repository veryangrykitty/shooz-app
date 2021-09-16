class Order < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  monetize :amount_cents

end
