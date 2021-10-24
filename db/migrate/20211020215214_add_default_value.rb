class AddDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :type_of_property, :string, default: "House"
  end
end
