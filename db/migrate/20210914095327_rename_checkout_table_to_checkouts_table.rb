class RenameCheckoutTableToCheckoutsTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :checkout, :checkouts
  end
end
