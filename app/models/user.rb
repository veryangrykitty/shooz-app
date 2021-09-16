class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :checkouts, class_name: "Checkouts", foreign_key: "buyer_id"
  has_many :listings, class_name: "Listing", foreign_key: "seller_id"
  has_many :orders
end
