class ForeignKeysCategoriesProductos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :productos, :categories
  end
end
