class ForeignKeysOrderItemsOrders < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_items, :orders
  end
end
