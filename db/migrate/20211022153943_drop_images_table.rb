class DropImagesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :images
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
