class UpdateCheckoutsModel < ActiveRecord::Migration[6.1]
  def change
    add_column :checkouts, :sneaker_model_name, :string
    add_column :checkouts, :state, :string
    add_monetize :checkouts, :amount, currency: { present: false }
    add_column :checkouts, :checkout_session_id, :string
  end
end
