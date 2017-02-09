class DayMeasurementMean < ActiveRecord::Base
  class << self
    def fetch_all
      result = {}
      self.all.each do |object|
        result[object.start_date.to_s] = object.mean.to_f
      end

      result
    end
  end
end
