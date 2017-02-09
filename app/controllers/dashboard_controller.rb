class DashboardController < ApplicationController

  def index
    @super_means = DayMeasurementMean.fetch_all
    @power_unit_means = PowerUnitPerDayMeasurementMean.fetch_all
  end
  
end
