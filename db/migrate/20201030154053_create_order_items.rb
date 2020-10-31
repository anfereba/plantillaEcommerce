class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.bigint :producto_id
      t.bigint :order_id
      t.float :total
      t.float :unit_price

      t.timestamps
    end
  end
end
