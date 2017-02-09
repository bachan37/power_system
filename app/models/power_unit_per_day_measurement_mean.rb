class PowerUnitPerDayMeasurementMean < ActiveRecord::Base
  class << self
    def fetch_all
      result = {}
      PowerUnit.all.each do |power_unit|
        sub_result = {}
        power_unit.mean_measurements.each do |object|
          sub_result[object.start_date.to_s] = object.mean.to_f
        end

        result[power_unit.unit] = sub_result
      end

      result
    end
  end
end
