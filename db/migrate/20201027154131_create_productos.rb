class CreateProductos < ActiveRecord::Migration[6.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.text :descripcion
      t.float :precio
      t.integer :category_id

      t.timestamps
    end
  end
end
