class RenameOrderTotalToTotalPrice < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :total, :total_price
  end
end
