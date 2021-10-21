class RemoveIllustrationFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :illustration, :string
  end
end
