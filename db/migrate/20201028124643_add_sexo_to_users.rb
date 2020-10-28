class AddSexoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sexo, :string
  end
end
