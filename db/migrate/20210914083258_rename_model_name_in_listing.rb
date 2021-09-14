class RenameModelNameInListing < ActiveRecord::Migration[6.1]
  def change
    rename_column :listings, :model_name, :sneaker_model_name
  end
end
