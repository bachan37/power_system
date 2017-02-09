class CreateDayMeasurementMeans < ActiveRecord::Migration
  def change
    create_table :day_measurement_means do |t|
      t.date :start_date
      t.decimal :mean, precision: 22, scale: 17
      t.timestamps null: false
    end

    add_index :day_measurement_means, :start_date
  end
end
