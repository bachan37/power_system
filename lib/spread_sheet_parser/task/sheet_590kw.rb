module SpreadSheetParser
  module Task
    module Sheet590kw
      def self.included(base)
        base.include InstanceMethods
      end

      module InstanceMethods
        def process_590kw
          self.process do |xlsx|
            power_unit = PowerUnit.create(unit: '590kW')
            power_unit_row_number = 2
            power_sub_unit_row_number = power_unit_row_number + 1
            power_sub_unit_start_row_number = power_sub_unit_row_number + 1

            power_unit_row = xlsx.row(power_unit_row_number)
            power_sub_unit_row = xlsx.row(power_sub_unit_row_number)
            
            power_unit_items = power_unit_row.compact
            total_rows = xlsx.last_row

            power_unit_items.each do |power_unit_item|
              power_sub_unit = power_unit.sub_units.create(unit: power_unit_item)

              (power_sub_unit_start_row_number..total_rows).to_a.each do |row_index|
                row = xlsx.row(row_index)
                index = power_unit_row.index(power_unit_item)
                sub_unit_measurement = power_sub_unit.measurements.new
                sub_unit_measurement.start_date = row[0]
                sub_unit_measurement.end_date = row[1]
                sub_unit_measurement.insolation = row[2]
                column_name = "unit_#{power_sub_unit_row[index].strip.downcase}"
                sub_unit_measurement.send("#{column_name}=", row[index])
                
                sub_unit_measurement.save if row[index].to_f > 0
              end
            end
          end
        end
      end
    end    
  end
end
