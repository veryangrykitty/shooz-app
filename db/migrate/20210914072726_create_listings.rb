class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :brand
      t.string :model_name
      t.string :size
      t.float :price
      t.string :condition
      t.boolean :availability
      t.references :seller, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
