class CreatePowerUnits < ActiveRecord::Migration
  def change
    create_table :power_units do |t|
      t.string :unit
      t.timestamps null: false
    end
  end
end
