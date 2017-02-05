class CreatePowerSubUnits < ActiveRecord::Migration
  def change
    create_table :power_sub_units do |t|
      t.references :power_unit
      t.date :start_date
      t.date :end_date
      t.decimal :insolation, precision: 22, scale: 17
      t.decimal :unit_a, precision: 22, scale: 17
      t.decimal :unit_d, precision: 22, scale: 17
      t.timestamps null: false
    end
    add_index :power_sub_units, :power_unit_id
  end
end
