class RenameTransactionsTableToCheckoutTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :checkout
  end
end
