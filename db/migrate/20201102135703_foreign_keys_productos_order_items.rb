class ForeignKeysProductosOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_items, :productos
  end
end
