class AddNombreToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nombre, :string
  end
end
