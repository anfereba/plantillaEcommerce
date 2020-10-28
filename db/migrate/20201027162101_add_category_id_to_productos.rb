class AddCategoryIdToProductos < ActiveRecord::Migration[6.0]
  def change
    add_column :productos, :category_id, :bigint
  end
end
