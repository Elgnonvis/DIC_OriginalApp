class AddDefaultValueToTables < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :description, :string, null: false
    change_column :properties, :address, :string, null: false
    change_column :properties, :price, :string, null: false
    change_column :properties, :name, :string, null: false
    change_column :comments, :content, :text, null: false
  end
end
