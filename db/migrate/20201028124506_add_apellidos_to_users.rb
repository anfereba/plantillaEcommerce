class AddApellidosToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :apellidos, :string
  end
end
