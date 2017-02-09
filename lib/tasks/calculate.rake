namespace :calculate do
  desc "Calculate the mean"

  task :unit_day_mean => :environment do
    first_date = Date.parse('2016-08-01')
    last_date = Date.parse('2016-08-31')
    
    PowerUnit.all.each do |power_unit|
      (first_date..last_date).to_a.each do |date|
        puts "#{power_unit.unit} on #{date.to_s}"
        power_unit.save_mean_per_day(date)
      end
    end
  end

  task :unit_day_super_mean => :environment do
    first_date = Date.parse('2016-08-01')
    last_date = Date.parse('2016-08-31')

    (first_date..last_date).to_a.each do |date|
      values = PowerUnitPerDayMeasurementMean.where(start_date: date).pluck(:mean)
      result = values.inject(:+) / values.size
      result = result.to_f
      DayMeasurementMean.create(start_date: date, mean: result)
      puts "#{date.to_s} mean #{result}"
    end
  end
end
