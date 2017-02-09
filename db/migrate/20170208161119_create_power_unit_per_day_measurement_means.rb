class CreatePowerUnitPerDayMeasurementMeans < ActiveRecord::Migration
  def change
    create_table :power_unit_per_day_measurement_means do |t|
      t.date :start_date
      t.decimal :mean, precision: 22, scale: 17
      t.references :power_unit
      t.timestamps null: false
    end

    add_index :power_unit_per_day_measurement_means, :power_unit_id
  end
end
