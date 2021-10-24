class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.text :description, null: false
      t.string :status, default: "Low"
      t.datetime :date, default: -> { "CURRENT_TIMESTAMP" }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
