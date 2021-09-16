class ModifyPricesToListings < ActiveRecord::Migration[6.1]
  def change
    remove_column :listings, :price
    add_monetize :listings, :price, currency: { present: false }
  end
end
