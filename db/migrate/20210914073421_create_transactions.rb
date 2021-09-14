class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :buyer, foreign_key: { to_table: 'users' }
      t.references :listing, foreign_key: true
      t.references :payment, foreign_key: true

      t.timestamps
    end
  end
end
