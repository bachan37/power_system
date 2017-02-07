module SpreadSheetParser
  module Task
    module Sheet683Point2kw
      def self.included(base)
        base.include InstanceMethods
      end

      module InstanceMethods
        def process_728kw
          self.process do |xlsx|
            power_unit = PowerUnit.create(unit: '728kW')
            power_unit_row_number = 2
            power_sub_unit_row_number = power_unit_row_number + 1
            power_sub_unit_start_row_number = power_sub_unit_row_number + 1

            power_unit_row = xlsx.row(power_unit_row_number)
            power_sub_unit_row = xlsx.row(power_sub_unit_row_number)
            
            power_unit_items = power_unit_row.compact
            total_rows = xlsx.last_row

            single_units = ["004", "006", "008", "012", "014", "016", "20", "022", "024", "028", "030", "032", "040", "048", "056", "064"]

            power_unit_items.each do |power_unit_item|
              power_sub_unit = power_unit.sub_units.create(unit: power_unit_item)

              (power_sub_unit_start_row_number..total_rows).to_a.each do |row_index|
                row = xlsx.row(row_index)
                index = power_unit_row.index(power_unit_item)
                sub_unit_measurement = power_sub_unit.measurements.new
                sub_unit_measurement.start_date = row[0]
                sub_unit_measurement.end_date = row[1]
                sub_unit_measurement.insolation = row[2]
                
                if single_units.include?(power_unit_item)
                  column_name = "unit_#{power_sub_unit_row[index].strip.downcase}"
                  sub_unit_measurement.send("#{column_name}=", row[index])
                else
                  first_column_name = "unit_#{power_sub_unit_row[index].downcase}"
                  sub_unit_measurement.send("#{first_column_name}=", row[index])
                  second_index = index + 3
                  second_column_name = "unit_#{power_sub_unit_row[second_index].downcase}"
                  sub_unit_measurement.send("#{second_column_name}=", row[index])
                end

                sub_unit_measurement.save
              end
            end
          end
        end
      end
    end    
  end
end
