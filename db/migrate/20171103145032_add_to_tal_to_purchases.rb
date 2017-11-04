class AddToTalToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :total, :decimal
  end
end
