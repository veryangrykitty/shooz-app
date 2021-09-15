class AddGenderToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :gender, :string
  end
end
