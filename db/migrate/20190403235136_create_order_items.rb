class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.decimal :unit_price, precision: 10, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end
