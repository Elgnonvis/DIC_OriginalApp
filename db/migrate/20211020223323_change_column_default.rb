class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :properties, :description, nil
    change_column_default :properties, :address, nil
    change_column_default :properties, :price, nil
    change_column_default :properties, :name, nil
    change_column_default :comments, :content, nil
  end
end
