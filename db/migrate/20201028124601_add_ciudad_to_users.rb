class AddCiudadToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ciudad, :string
  end
end
