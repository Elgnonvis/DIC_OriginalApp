class ChangeDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default( :properties, :price, from: 0, to: 25000 )
  end
end
