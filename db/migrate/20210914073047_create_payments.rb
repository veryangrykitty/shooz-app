class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.boolean :success

      t.timestamps
    end
  end
end
