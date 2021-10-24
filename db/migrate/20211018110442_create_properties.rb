class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :type_of_property
      t.text :description
      t.string :illustration
      t.string :address
      t.integer :price
      t.string :status, default: "Occupied"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
