class CreatePowerSubUnits < ActiveRecord::Migration
  def change
    create_table :power_sub_units do |t|
      t.string :unit
      t.references :power_unit
      t.timestamps null: false
    end
    add_index :power_sub_units, :power_unit_id
  end
end
