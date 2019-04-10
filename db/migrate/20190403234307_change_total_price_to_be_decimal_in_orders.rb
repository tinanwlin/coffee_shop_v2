class ChangeTotalPriceToBeDecimalInOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :total_price, :decimal, precision: 10, scale: 2
  end
  def down
    change_column :orders, :total_price, :float
  end
end
