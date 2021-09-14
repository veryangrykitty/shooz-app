class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions, class_name: "Transaction", foreign_key: "buyer_id"
  has_many :listings, class_name: "Listing", foreign_key: "seller_id"
  # has_many :selltransactions, class_name: "Transaction", through: :listings
end
