class AddTelefonoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :telefono, :string
  end
end
