class ChangeTableColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :price
    add_column :properties, :price, :integer, default: 0
  end
end
