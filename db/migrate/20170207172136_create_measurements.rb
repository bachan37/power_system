class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :insolation, precision: 22, scale: 17
      t.decimal :unit_a, precision: 22, scale: 17
      t.decimal :unit_b, precision: 22, scale: 17
      t.decimal :unit_c, precision: 22, scale: 17
      t.decimal :unit_d, precision: 22, scale: 17
      t.references :power_sub_unit
      t.timestamps null: false
    end
    add_index :measurements, :power_sub_unit_id
    add_index :measurements, :start_date
  end
end
