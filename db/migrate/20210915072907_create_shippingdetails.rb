class CreateShippingdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :shippingdetails do |t|
      t.string :firstname
      t.string :lastname
      t.string :contact
      t.text :address
      t.string :city
      t.string :country
      t.string :postal
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
