class PowerUnit < ActiveRecord::Base
  has_many :sub_units, class_name: 'PowerSubUnit', foreign_key: 'power_unit_id'
  has_many :measurements, through: :sub_units
  has_many :mean_measurements, class_name: "PowerUnitPerDayMeasurementMean", foreign_key: "power_unit_id"

  def save_mean_per_day(start_date)
    measurement_object = self.mean_measurements.find_or_initialize_by(start_date: start_date)
    mean = self.calculate_mean_per_day(start_date)
    measurement_object.mean = mean
    measurement_object.save
  end

  def calculate_mean_per_day(start_date)
    measurement_objects = self.measurements.where(start_date: start_date)
    return nil if measurement_objects.blank?
    
    values = []

    measurement_objects.each do |measurement_object|
      ["unit_a", "unit_b", "unit_c", "unit_d"].each do |column_name|
        value = measurement_object.send(column_name).to_f
        values << value if value > 0
      end
    end

    return nil unless values.size > 0
    
    result = values.inject(:+) / values.size.to_f
    result
  end
  
  class << self

    private

    def reset
      ActiveRecord::Base.connection.execute('truncate table power_units')
    end
  end
end
